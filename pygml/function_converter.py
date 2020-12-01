from precomp_version_isolate import version_trim

import re, textwrap

import jsbeautifier

FIELDS = "../object_fields_output.txt"

INPUT = """
C CODE GOES HERE
"""

def rreplace(s, old, new, occurrence):
    li = s.rsplit(old, occurrence)
    return new.join(li)

objs = []
class FuncArg:
    def __init__(self, name, type, pointer, struct_type, is_used):
        self.name = name
        self.type = type
        self.pointer = pointer
        self.struct_type = struct_type
        self.is_used = is_used
        
JSDOC_FUNC_PRE    = "/// @function   "
JSDOC_DESC_PRE    = "/// @desc       "
JSDOC_DESC2_PRE   = "///             "
JSDOC_PARAM_PRE   = "/// @param      "
JSDOC_RETURNS_PRE = "/// @returns    "
JSDOC_LINE_LENGTH = 80
JSDOC_INDENT_UNTIL = 32
JSDOC_INDENT_UNTIL2 = 48

VAR_TYPES = ["u8", "u16", "u32",\
             "s8", "s16", "s32",\
             "f8", "f16", "f32"]

RESERVED_WORDS = ["floor", "ceil", "min", "max", "room", "health", "gravity",\
                  "x", "y", "lives", "points"]

RESERVED_WORDS_DOT_REF_OK = ["x", "y"]

PTR_PRE = "Ptr.p_"

SIMPLE_REPLACEMENTS = [
["->", "."],
["NULL", "null"],
["TRUE", "true"],
["FALSE", "false"],
["M_PI", "pi"],
]

fields_dict = []

# initialize fields dictionary
def fields_dict_init():
    global fields_dict
    with open(FIELDS, 'r') as f:
        fields_dict=f.read().split('\n')

    for i in range(0, len(fields_dict)):
        fields_dict[i] = re.sub(r'\W+', '', fields_dict[i])

# basic 1:1 substitutes
def simple_replacements(s):
    for rep in SIMPLE_REPLACEMENTS:
        rx = r'(\b{0}\b)'.format(rep[0])
        s = re.sub(rx, rep[1], s)
    return s

# wrap object fields in rawData
def raw_data_wrapper(s):
    
    for i in range(0, len(fields_dict)-1):
        f = fields_dict[i]
        rx = r'(\.)(\b{0}\b)'.format(f)
        s = re.sub(rx, r'.rawData[\2]', s)
        
    return s

# variable definitions of struct-refs
def local_struct_refs(s):
    # NOT set to value
    s = re.sub(r'(\bstruct\s*)(\w*)(\s*\*)(\w*)(\;)',\
               r'var \4 = {}; // \2', s, flags=re.DOTALL)

    # SET to value
    s = re.sub(r'(\bstruct\s*)(\w*)(\s*\*)(\w*)(\s*\=\s*)',\
               r'var \4\5', s, flags=re.DOTALL)
    
    return s

# strip f float appends
def float_strip_f(s):
    s = re.sub(r'([\d\s]\.\d*)(f)', r'\g<1>0', s)
    return s

# replace "vartype N ="
def var_equals_replacements(s):
    for i in range(0, len(VAR_TYPES)):
        v = VAR_TYPES[i]
        rx = r'(\s*\b)({0})(\b\s*\w*\s*\=\s*)'.format(v)
        s = re.sub(rx, r'\1var\3', s)

    return s

# replace "vartype N;"
def var_nullset_replacements(s):
    for i in range(0, len(VAR_TYPES)):
        v = VAR_TYPES[i]
        rx = r'(\s*\b)({0})(\b\s*\w*)(\s*;)'.format(v)
        s = re.sub(rx, r'\1var\3 = 0\4', s)

    return s

# replace "var array[n];" definitions
def var_nullset_array_replacement(s):
    for i in range(0, len(VAR_TYPES)):
        v = VAR_TYPES[i]
        rx = r'(\s*\b)(s32)(\b\s*\w*)(\[)(\d*)(\])(\;)'.format(v)
        s = re.sub(rx, r'\1var\3 = array_create(\5)\7', s)
    return s

# var vec3* replacement
def vec3_nullset_replacements(s):
    s = re.sub(r'(\s*\b)(Vec3\w)(\b\s*\w*)(\s*;)', r'\1var\3 = \2\4', s)
    return s

# var vec4* replacement
def vec4_nullset_replacements(s):
    s = re.sub(r'(\s*\b)(Vec4\w)(\b\s*\w*)(\s*;)', r'\1var\3 = \2\4', s)
    return s

# var Mat4 replacement
def mat4_nullset_replacements(s):
    s = re.sub(r'(\s*\b)(Mat4\w*)(\b\s*\w*)(\s*;)', r'\1var\3 = \2\4', s)
    return s

# get function header
def function_get_header(s):
    s = re.search(r'([\w]*\b\s)(\w*)(\()([\w\s\(\)\*\,]+)(\)\s*)(\{)', s)
    return s

# function name
def function_get_name(s):
    header = function_get_header(s)
    return header.group(2)

# function type
def function_get_type(s):
    header = function_get_header(s)
    s = header.group(1)
    s = re.sub(r'(\W)', '', s)
    
    return s

# function args
def function_get_args(s):
    header = function_get_header(s)

    string = header.group(4)

    args = string.split(',')

    for i in range(0, len(args)):
        args[i] = args[i].strip()
    
    return args

def unused_variable_comment_out(s):

    s = re.sub(r'(UNUSED)(\s*var\s*)', r'/* \1 */ \2', s)

    return s

# strip function header
def function_remove_header(s):
    header = function_get_header(s).group()
    s = s.replace(header, '')
    return s

def Ptr(s):
    if s[0] == "_":
        s = s[1::]

    s = PTR_PRE + s
    return s

# cleans a variable in function header/args to prevent them being reserved words
def var_clean(s):
    s = re.sub(r'[\W]', '', s)

    for i in range(0, len(RESERVED_WORDS)):
        rx = r'(\b{0}\b)'.format(RESERVED_WORDS[i])
        s = re.sub(rx, r'_\1', s)
        
    return s

# cleans all variables within the body of a function
def func_vars_clean(s):
    
    for i in range(0, len(RESERVED_WORDS)):
        rx = r'(\b{0}\b)'.format(RESERVED_WORDS[i])
        s = re.sub(rx, r'_\1', s)
        
    return s

# certain reserved words can be dot-referenced, so fix their underscore prefixes
def func_dot_reserve_fix(s):
    
    for i in range(0, len(RESERVED_WORDS_DOT_REF_OK)):
        rx = r'(\.)(\_)({0}\b)'.format(RESERVED_WORDS_DOT_REF_OK[i])
        s = re.sub(rx, r'\1\3', s)
        
    return s

# does the function contain a reference to 'o', gCurrentObject?
def contains_o_ref(s):
    return re.search(r'(\bo\b)', s)

# is "o" an argument?
def arg_is_o(s):

    for o in objs:
        if o.name == "o":
            return True
        
    return False

# does 'o' need to be defined as gCurrentObject? if so, create string
def insert_o_definition(s):

    if (contains_o_ref(s)):
        if (not arg_is_o(s)):
            return "\n\nvar o = gCurrentObject;\n"
            
    return ""

def function_args_classify(arr):
    global objs
    objs = []

    for a in arr:

        is_used = True
        if ("UNUSED" in a):
            a = a.replace("UNUSED", "")
            a = a.strip()
            is_used = False
            
        lst = a.split(" ")
        name = lst[-1]
        type = lst[0]
        pointer = False
        if type in VAR_TYPES:
            if "*" in name:
                pointer = True
        name = var_clean(name)
        struct_type = ""
        
        if "struct" in type:
            struct_type = lst[1]

        
        obj = FuncArg(name, type, pointer, struct_type, is_used)
        objs.append(obj)
    
    return objs

# generate a formatted JSDOC header for a function
def jsdoc_generate(ftype, name, args, desc):
    
    # format arguments
    f_desc = textwrap.fill(desc, JSDOC_LINE_LENGTH -\
                           len(JSDOC_DESC_PRE)).split("\n")

    # format arguments as plain string list, with Pointer prefixes, if necessary
    args_str = function_f_args_to_string(args, True)

    # output string, start with function name
    string = "%s%s(%s)\n" % (JSDOC_FUNC_PRE, name, args_str)

    # description lines
    for i in range(0, len(f_desc)):
        prepend = JSDOC_DESC_PRE
        if i > 0:
            prepend = JSDOC_DESC2_PRE
        string += "%s%s\n" % (prepend, f_desc[i])

    # arguments
    for a in args:
        line = "%s{%s}" % (JSDOC_PARAM_PRE, a.type)
        while len(line) < JSDOC_INDENT_UNTIL:
            line += " "
        note = ""
        nm = a.name
        if (a.pointer):
            note = " // number pointer"
            nm = Ptr(nm)

        line += nm

        # append struct type
        if len(a.struct_type)>0:
            #while len(line) < (JSDOC_INDENT_UNTIL2):
            #   line += " "
            line += " (%s)" % a.struct_type

        # note unused variables
        if (not a.is_used):
            line += " (UNUSED)"
            
        string += line + note + "\n"

    # returns
    bad_return_append = ""
    if bad_return:
        bad_return_append = "//! BAD_RETURN"
        
    return_line = "%s{%s}" % (JSDOC_RETURNS_PRE, ftype)
    while len(return_line) < JSDOC_INDENT_UNTIL:
        return_line += " "
    return_line += bad_return_append

    return_line += "\n"

    string += return_line

    # actual function declaration, no Pointer prefixes
    args_str = function_f_args_to_string(args, False)
    string += "function %s(%s) {" % (name, args_str)

    return string

# converts formatted function arguments to a single string
def function_f_args_to_string(args, ptr_prefix):

    s = ""
    for i in range(0, len(args)):
        if i > 0:
            s += ", "
        name = args[i].name
        if ptr_prefix and args[i].pointer:
            name = Ptr(name)
        s += name
        
    return s

def function_generate_header(s):
    ftype = function_get_type(s)
    name = function_get_name(s)
    args = function_get_args(s)

    f_args = function_args_classify(args)

    desc = "This is an example of a description for a\
function that, if long enough, will be sliced up and then\
overflow to the next line at the nearest whole word"
    jsdoc = jsdoc_generate(ftype, name, f_args, desc)

    s = jsdoc
    return s

def function_prepend_header(s, h):

    h += insert_o_definition(s)
    
    s = h + s
    
    return s

def inline_val_set_clear(s):
    s = re.sub(r'(\s*if\s*\(+)(\w*\.\w*\[?\d?\]?)(\s[\+\-\*\/\=]{1,2}\s*)(\w*\s*[\/\+\-\*\=]{0,2}\s*[\d\.\w]*)(\)+\s[\>\<\=]{1,2}\s*)',\
               r'\n\n\2\3\4; // inline fix\1\2\5', s)
    return s

def ptr_inserts(s):
    # @TODO ensure isn't struct passed in via argument
    s = re.sub(r'(\&)(\b\w*\b)([\w\s\,\(\)]*)(\)\;)', r'\2\3\4\n\2 = Ptr.p_\2;\n', s)
    return s;

# double underscore fix for pointers
def ptr_double_under_fix(s):
    s = s.replace(PTR_PRE + "_", PTR_PRE)
    return s

# insert pointers before any returns
def ptr_before_returns(s):

    has_pointer = False
    vrs = ""
    for o in objs:
        if o.pointer:
            has_pointer = True
            vrs += "%s = %s;\n" % (Ptr(o.name), o.name)

    if has_pointer:
        vrs = "/* return ptrs start */\n" + vrs + "/* return ptrs end */\n"

    rx = r'(\breturn\b)'
    if re.search(rx, s):
        s = re.sub(rx, vrs + r'\n\1', s)
    else:
        # no returns found -- before last closing curly bracket
        s = rreplace(s, "}", vrs + "\n}", 1)
        
    
    return s

# BAD_RETURN strip
def bad_return_strip(s):
    global bad_return
    bad_return = False
    rx = r'(\bBAD_RETURN\b\()(\w*)(\))'
    if re.search(rx, s):
        s = re.sub(rx, r'\2', s)
        bad_return = True
    return s

# mat4 @M ref
def mat4_m_indices_replacements(s):
    s = re.sub(r'(\[)([0123])(\])(\[)([0123])(\])', r'\1M\2\5\6', s)
    return s

# register removal
def register_removal(s):
    for i in range(0, len(VAR_TYPES)):
        v = VAR_TYPES[i]
        rx = r'(\s*register)(\s*)(\b{0}\b)'.format(v)
        s = re.sub(rx, r'\3', s)
 
    return s

def asterix_ref_passed_in_vars(s):
    for o in objs:
        rx = r'(\s*\*\b)({0})(\b)'.format(o.name)
        s = re.sub(rx, r'\2', s)
    return s

# static vartype removals
def static_replacements(s):
    for i in range(0, len(VAR_TYPES)):
        v = VAR_TYPES[i]
        rx = r'(\s*static)(\s*)(\b{0}\b)'.format(v)
        s = re.sub(rx, r'\3', s)
 
    return s

# var type casting replacements
def var_type_cast_replacements(s):
    for i in range(0, len(VAR_TYPES)):
        v = VAR_TYPES[i]
        rx = r'(\()(\b{0}\b)(\))'.format(v)
        s = re.sub(rx, '', s)
 
    return s

# adds "@" refs to arrays that are passed in
def array_at_replacements(s):

    # note no dot refs to arrays, because those are assumed to be a part of a struct
    for o in objs:
        rx = r'(\s*{0})(\[)(\d)'.format(o.name)
        s = re.sub(rx, r'\1\2@ \3', s)
        
    return s

# quality of life, wrap cases in parenthesis
def qol_case_wrap(s):
    s = re.sub(r'(\bcase)(\s+)(\w*)(\s*)(\:)', r'\1(\3)\5', s)
    return s

# main converter for functions
def convert(s):

    s = bad_return_strip(s)
    s = var_type_cast_replacements(s)
    s = static_replacements(s)
    s = register_removal(s)
    h = function_generate_header(s)
    s = function_remove_header(s)
    
    s = version_trim(s)
    s = simple_replacements(s)
    s = raw_data_wrapper(s)
    s = local_struct_refs(s)
    s = float_strip_f(s)
    s = var_nullset_array_replacement(s)
    s = var_equals_replacements(s)
    s = var_nullset_replacements(s)
    s = unused_variable_comment_out(s)
    s = vec3_nullset_replacements(s)
    s = vec4_nullset_replacements(s)
    s = mat4_nullset_replacements(s)
    s = mat4_m_indices_replacements(s)
    s = inline_val_set_clear(s)
    s = func_vars_clean(s)
    s = ptr_inserts(s)
    s = ptr_before_returns(s)
    s = ptr_double_under_fix(s)
    s = func_dot_reserve_fix(s)
    s = asterix_ref_passed_in_vars(s)
    s = array_at_replacements(s)

    s = qol_case_wrap(s)

    s = function_prepend_header(s, h)

    # js beautify string
    s = jsbeautifier.beautify(s)
    
    return s


def main():
    fields_dict_init()

    res = convert(INPUT)
    print(res)
    
          
if __name__ == "__main__":
    main()
