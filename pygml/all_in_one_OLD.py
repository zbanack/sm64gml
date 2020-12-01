import re
import win32clipboard
import hashlib
import textwrap
import jsbeautifier

VERSION = "1.0"

firstIndices = [
"oFloorType","oDialogResponse","oBooTurningSpeed","oBowserUnk108",
"oBowserHeldAngleVelYaw","oBowserAngleToCentre","oBowserEyesShut","oBubbaUnk1AC",
"oBubbaUnk1B0","oCloudFwooshMovementRadius","oDorrieGroundPounded",
"oDorrieNeckAngle","oKleptoTargetNumber","oKleptoUnk1B0","oKoopaCountdown",
"oKoopaTheQuickInitTextboxCooldown","oCameraLakituPitchVel",
"oRacingPenguinFinalTextbox","oRacingPenguinReachedBottom",
"oPlatformOnTrackIsNotSkiLift","oPlatformOnTrackType",
"oSkeeterUnk1AC","oSnufitXOffset","oSnufitZOffset","oUkikiTauntCounter",
"oUkikiTextState","oUkikiCageSpinTimer","oUnagiUnk1B0","oWigglerUnused",
]

secondIndices = [
"oDialogState","oFloorRoom","oBowserUnk106",
"oBowserHeldAnglePitch","oBowserUnk10E","oBowserAngleToCentre",
"oBowserUnk1AE","oBowserUnk1B2","oKoopaTheQuickRaceIndex",
"oUkikiTauntsToBeDone","oUkikiTextboxTimer","oUkikiHasHat",
]

FOLDER_LOC = "C:\\Users\\Zack\\Desktop\\sm64_conv\\"

LOAD_DIR = False
CLIPBOARD = True 
TESTING = False

POINTER_PREFIX = "Ptr.p_"

TEST_STRING = """
s32 camera_approach_s16_symmetric_bool(s16 *current, s16 target, s16 increment) {
    s16 dist = target - *current;

    if (increment < 0) {
        increment = -1 * increment;
    }
    if (dist > 0) {
        dist -= increment;
        if (dist >= 0) {
            *current = target - dist;
        } else {
            *current = target;
        }
    } else {
        dist += increment;
        if (dist <= 0) {
            *current = target - dist;
        } else {
            *current = target;
        }
    }
    if (*current == target) {
        return FALSE;
    } else {
        return TRUE;
    }
}
"""

REP_MODEL = [
    ["const Gfx ", ""],
    ["[] = {", " = ["],
    ["static const Vtx ", ""],
    ["static const Lights1 ", ""],
    ["gsDPPipeSync", "//gsDPPipeSync"],
    ["gsDPTileSync", "//gsDPTileSync"],
    ["gsDPLoadSync", "//gsDPLoadSync"],
    [", CALC_DXT", "), //CALC_DXT"],
    ["static ", ""],
    ["{{{", "new Vtx(["],
    ["}}}", "])"],
    ["}, 0, {", "], 0, ["],
    ["}, {", "], ["],
    ["};", "];"],
    [".l,", ".l[0],"],
    ["(&", "("],
    ["NULL", "null"],
    ["UNUSED ", ""],
    ]

REP_GEO = [
    ["const GeoLayout ", ""],
    ["()", "]"],
    ["(", ", "],
    [")", "]"],
    ["GEO_ASM", "//GEO_ASM"],
    ["GEO_", "[GCMD_"],
    ["CULLING_RADIUS", "CULL"],
    ["OPEN_NODE", "OPEN"],
    ["DISPLAY_LIST", "DLIST"],
    ["CLOSE_NODE", "CLOSE"],
    ["NODE_SCREEN_AREA", "SCREEN"],
    ["NODE_ORTHO", "ORTHO"],
    ["NODE_START", "START"],
    ["CAMERA_FRUSTUM_WITH_FUNC", "PERSP"],
    ["RENDER_OBJ", "PARENT"],
    ["ROTATION_NODE", "ROT"],
    ["SWITCH_CASE", "SWITCH"],
    ["ANIMATED_PART", "ANIM"],
    ["[] = {", " = ["],
    ["};", "];"],
    ["NULL", "null"],
]

REP_BHV = [
    ["const BehaviorScript ", ""],
    ["()", "]"],
    ["(", ", "],
    [")", "]"],
    
    ["BEGIN", "[BCMD_BEGIN"],
    ["OR_INT", "[OR_INT"],
    ["OR_INT", "[OR_INT"],
    
    ["OR_INT", "[BCMD_OR_INT"],
    ["ADD_INT", "[BCMD_ADD_INT"],
    ["SET_INT", "[BCMD_SET_INT"],
    ["BEGIN_LOOP", "[BCMD_LOOP_BEGIN"],
    ["END_LOOP", "[BCMD_LOOP_END"],
    ["CALL_NATIVE", "[BCMD_CALL"],
    ["BREAK", "[BCMD_BREAK"],
    ["LOAD_ANIMATIONS", "[BCMD_ANIMATION"],
    ["ANIMATE", "[BCMD_ANIMATE"],
    ["SET_OBJ_PHYSICS", "[BCMD_PHY"],
    ["SET_HOME", "[BCMD_HOME"],
    ["DROP_TO_FLOOR", "[BCMD_DROP_TO_FLOOR"],
    ["BEGIN_REPEAT", "[BCMD_REPEAT_BEGIN"],
    ["END_REPEAT", "[BCMD_REPEAT_END"],
    ["SPAWN_CHILD", "[BCMD_SPAWN_CHILD"],
    ["DEACTIVATE", "[BCMD_DEACTIVATE"],

    ["[] = {", " = ["],
    ["};", "];"],
    [", ,", ", "],
    ["]],", "],"],
    ["[[B", "[B"],
    ["[[B", "[B"],
    ["NULL", "null"],
    ["[BCMD_[", "["],
    ["BILLBOARD", "[BCMD_CYCL"],
]

REP_TEX = [
    ["ALIGNED8 static const u8 ", ""],
    ["[] = {", " = sprite_add_from_rom("],
    ["};", ");\n"],
    ["#include ", ""],
    ["( \"", "(\""],
    ["\" )", "\")"],
    
]

REP_COLL = [
    ["[] = {", " = ["],
    ["};", "];"],
    ["const Collision ", ""],
]

REP_ANIM = [
    ["static const s16 ", ""],
    ["static const u16 ", ""],
    ["[] = {", " = ["],
    ["};", "];"],
    ["static const struct Animation ", ""],
    
]

REP_ANIM_TABLE = [
    ["[] = {", " = ["],
    ["const struct Animation *const ", ""],
    ["&", ""],
    ["};", "];"],
    ["NULL", "null"],
]

REP_FUNC = [
    ["->", "."],
    ["(f8)", ""],
    ["(f16)", ""],
    ["(f32)", ""],
    ["(s8)", ""],
    ["(s16)", ""],
    ["(s32)", ""],
    ["(u8)", ""],
    ["(u16)", ""],
    ["(u32)", ""],
    ["UNUSED ", ""],
    ["u8 ", "var "],
    ["u16 ", "var "],
    ["u32 ", "var "],
    ["s8 ", "var "],
    ["s16 ", "var "],
    ["s32 ", "var "],
    ["f8 ", "var "],
    ["f16 ", "var "],
    ["f32 ", "var "],
    ["gMarioObject", "gMarioObject[0]"],
    ["o.o", "o.rawData[o"],
    ["obj.o", "obj.rawData[o"],
    ["o.parentObj.o", "o.parentObj.rawData[o"],
    ["[0].o", "[0].rawData[o"],
    ["(void)", "()"],
    ["1ULL", "/*1ULL*/ 1 "],
    ["(void *)", ""],
    [" *(", " ("],
    ["var *", "var "],
    ["segmented_to_virtual", ""],
    ["NULL", "null"],
    ["FALSE", "false"],
    ["TRUE", "true"],
    ["#define ", "var "],
    ["absf", "abs"],
    ["sqrtf", "sqrt"],
    ["absi", "abs"],
    
]

def ClipSet(string):
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardText(string)
    win32clipboard.CloseClipboard()
    
def ClipGet():
    win32clipboard.OpenClipboard()
    string = win32clipboard.GetClipboardData()
    win32clipboard.CloseClipboard()

    return string

def replace_between(_string, start, end, rep):
    reg = "(?<=%s).*?(?=%s)" % (start,end)
    r = re.compile(reg,re.DOTALL)
    result = r.sub(rep, _string)
    return result

def rreplace(s, old, new, count):
    return (s[::-1].replace(old[::-1], new[::-1], count))[::-1]

def removeComments(string, singleLine):
    string = re.sub(re.compile("/\*.*?\*/",re.DOTALL ), "" ,string, 1)
    if (singleLine):
        string = re.sub(re.compile("//.*?\n" ), "" , string)
    return string

def funcGetInfo(func_str):
    
    func_str = func_str.replace("(void)", "()")
        
    reg = "(\w+\s)(\w+)(\(.*?\))(\s*\{)"
    r = re.search(reg, func_str)

    _name = r.group(2)
    _args = funcArgs(r.group(3))
    _rets = r.group(1).strip(" ")

    if (_rets.find("void") != -1):
        _rets = ""

    reg = "/\*.*?\*/"
    r = re.search(reg, func_str, flags=re.DOTALL)
    comment = ""
    if (not r is None):
        comment = r.group(0)
        comment = comment.replace("/*", "").replace("*/", "").replace("*", "").replace("\n", "").replace("\r", "").strip(" ")

        comment_cols = 60
        comment = '\n///\t\t\t\t\t'.join(textwrap.wrap(comment, width=comment_cols, replace_whitespace=False))
    
    return funcJSDoc(_name, _args, _rets, comment)

def funcArgs(func_arg_str):

    func_arg_str = func_arg_str.replace("UNUSED", "")
    func_arg_str = re.sub(r'[^a-zA-Z0-9_\s\*,]+', '', func_arg_str)

    splits = func_arg_str.split(",")
    args = []
    types = []
    is_pointer = []

    for s in splits:
        this_var = s.split(" ")[-1]
        args.append(this_var)
        this_type = s.strip(" ").split(" ")[0]
        types.append(this_type)

        ptr = False
        if (
            this_type == "s8" or\
            this_type == "s16" or\
            this_type == "s32" or\
            this_type == "f8" or\
            this_type == "f16" or\
            this_type == "f32" or\
            this_type == "u8" or\
            this_type == "u16" or\
            this_type == "u32"):
             if this_var.find("*") != -1:
                 ptr = True
                 
        is_pointer.append(ptr)
        
    return [args, types, is_pointer]

def funcJSDoc(func_name, func_args, func_rets, _func_comment):

    desc = _func_comment
    returns = func_rets

    args = func_args[0]
    types = func_args[1]
    points = func_args[2]    

    pointer_args = []
    for i in range(0, len(args)):
        args[i] = args[i].replace("*", "")

        pts = args[i]
        if (points[i]):
            pts = POINTER_PREFIX + pts
        pointer_args.append(pts)
        
    func_compound = func_name + "(" + ', '.join(pointer_args) + ")"
    func_leading = "function " + func_name + "(" + ', '.join(args) + ") {"
    cleaned_args = args
    ret = "/// @function\t" + func_compound + "\n"
    
    if len(desc) > 0:
        ret += "/// @desc\t\t" + desc + "\n"
    
    for i in range(0, len(args)):
        param_type = types[i]
        if (len(param_type)<1):
            continue

        tabs = "\t\t"

        ispt = ""

        if points[i]:
            ispt = POINTER_PREFIX
            
        if (param_type == "struct"):
            tabs = "\t"
            
        ret += "/// @param\t\t{" + param_type + "}" + tabs + ispt + args[i] + "\n"

    if len(returns) > 0:
        ret += "/// @returns\t" + returns + "\n"

    
    return [ret, func_leading, cleaned_args]

def main():
    
    if LOAD_DIR:
        prefix = "func"
        postfix = ".txt"
        _start = 0
        _end = 6

        accum = ""
        accum_pre = ""
        for i in range(_start, _end):
            fname = FOLDER_LOC + prefix + str(i) + postfix

            with open(fname,"r") as f:
                 string = f.read()
                 accum_pre += string + "\n\n"
                 accum += parseBlock(string) + "\n\n"

        ClipSet(accum)
        

    # get clipboard data
    elif CLIPBOARD:
        string = ClipGet()
        ret = parseBlock(string)
        print(ret)
        ClipSet(ret)

    # use text string
    elif TESTING:
        string = TEST_STRING
        ret = parseBlock(string)
        print(ret)
        ClipSet(ret)

    raise SystemExit

def stripVersion(_string):
    _string = _string.split("\n")

    skipping = False

    lines = []

    macro_line = False

    encounteredUS = False
    
    for i in range(0, len(_string)):

        line = _string[i]

        macro_line = False

        # if defined
        if ("#ifdef" in line or "#elif" in line):
            macro_line = True
            if (not "VERSION_US" in line):
                skipping = True
                encounteredUS = True

        # if not defined
        elif ("#ifndef" in line):
            macro_line = True
            if ("VERSION_US" in line):
                skipping = True
                encounteredUS = True

        # else
        elif ("#else" in line):
            macro_line = True
            if not encounteredUS:
                skipping = not skipping

        #end
        elif ("#endif" in line):
            macro_line = True
            skipping = False
            encounteredUS = False

        if (not macro_line and not skipping):
            lines.append(line)

    _string = "\n".join(lines)

    return _string

FORCE_TYPE = -1
def parseBlock(_string):

    PARTIAL_MODE = False

    string = stripVersion(_string)

    TYPE_UNKNOWN = -1
    TYPE_GEO = 0
    TYPE_MODEL = 1
    TYPE_TEXTURE = 2
    TYPE_COLLISION = 3
    TYPE_ANIMATION = 4
    TYPE_ANIMATION_TABLE = 5
    TYPE_FUNCTION = 6
    TYPE_BEHAVIOR = 7

    text_type = TYPE_UNKNOWN

    types = 0
    if FORCE_TYPE < 0:
        if types < 2 and string.find("const Vtx") != -1:
            text_type = TYPE_MODEL
            types+=1
        if types < 2 and string.find("GEO_") != -1:
            text_type = TYPE_GEO
            types+=1
        if types < 2 and string.find("const Collision") != -1:
            text_type = TYPE_COLLISION
            types+=1
        if types < 2 and string.find("Animation *const") != -1:
            text_type = TYPE_ANIMATION_TABLE
            types+=1
        if types < 2 and string.find("BEGIN(") != -1:
            text_type = TYPE_BEHAVIOR
            types+=1
        elif types < 2 and string.find("ANIMINDEX_NUMPARTS") != -1:
            text_type = TYPE_ANIMATION
            types+=1
        if types < 2 and string.find("ALIGNED8 static const u8") != -1:
            text_type = TYPE_TEXTURE
            types = 1 # +=1
    else:
        text_type = FORCE_TYPE
        types+=1

    # function-seeking
    if types < 1:
        if string.find("(void)") != -1 or\
        string.find("s8 ") != -1 or\
        string.find("s16 ") != -1 or\
        string.find("s32 ") != -1 or\
        string.find("f8 ") != -1 or\
        string.find("f16 ") != -1 or\
        string.find("f32 ") != -1 or\
        string.find("u8 ") != -1 or\
        string.find("u16 ") != -1 or\
        string.find("u32 ") != -1 or\
        string.find("static ") != -1 or\
        string.find("void ") != -1:
            text_type = TYPE_FUNCTION
            types += 1

    if FORCE_TYPE == TYPE_FUNCTION and not text_type == TYPE_FUNCTION:
        PARTIAL_MODE = True
        

    if (types > 1):
        print("Mixed contents, please separate manually")
        text_type = TYPE_UNKNOWN

    if text_type == TYPE_GEO:
        print("Geo")
        for r in REP_GEO:
            string = string.replace(r[0], r[1])
    elif text_type == TYPE_BEHAVIOR:
        print("Behavior")
        for r in REP_BHV:
            string = string.replace(r[0], r[1])
    elif text_type == TYPE_MODEL:
        print("Model")
        for r in REP_MODEL:
            string = string.replace(r[0], r[1])
    elif text_type == TYPE_COLLISION:
        print("Collision")
        for r in REP_COLL:
            string = string.replace(r[0], r[1])
    elif text_type == TYPE_ANIMATION_TABLE:
        print("Animation Table")
        for r in REP_ANIM_TABLE:
            string = string.replace(r[0], r[1])
    elif text_type == TYPE_ANIMATION:
        print("Animation")
        for r in REP_ANIM:
            string = string.replace(r[0], r[1])

        string = rreplace(string, "];", ");", 1)
        string = rreplace(string, "= {", "= new Animation(", 1)
    elif text_type == TYPE_TEXTURE:
        print("Texture")
        string = removeComments(string, True)
        string = " ".join(string.splitlines())
        for r in REP_TEX:
            string = string.replace(r[0], r[1])

        string = string.splitlines()
        for i in range(0, len(string)):
            string[i] = string[i].strip(" ")


            first = string[i].split(" ")[0]

            string[i] = "global.__" + string[i]
            string[i]+="\n#macro " + first + " (global.__" + first + ")\n"

        string = "\n".join(string)
    elif text_type == TYPE_FUNCTION:
        print("Function")

        string = re.sub(r'(BAD_RETURN\(\w+\))', 'void', string)

        jsdoc = ""
        header = ""
        leading = ""
        cleaned_args = []
        
        if not PARTIAL_MODE:
            jsdoc = funcGetInfo(string)
            header = jsdoc[0]
            leading = jsdoc[1]
            
            cleaned_args = jsdoc[2]
            

        string = removeComments(string, False)
        string = re.sub(r'(static\s|void\s|s8\s|s16\s|s32\s|f8\b|f16\s|f32\s|u8\s|u16\s|u32\s)+(\w+\(.*?\)\s+\{)', leading, string)
        
        for r in REP_FUNC:
            string = string.replace(r[0], r[1])

        string = re.sub(r'(o.rawData\[o)(\w+)', r'\1\2]', string)
        string = re.sub(r'(obj.rawData\[o)(\w+)', r'\1\2]', string)
        string = re.sub(r'(parentObj.rawData\[o)(\w+)', r'\1\2]', string)
        string = re.sub(r'(\[0\].rawData\[o)(\w+)', r'\1\2]', string)

        # replace sound refs
        #string = re.sub(r'(\bSOUND_\w+)', r'/*\1*/ -1', string)
        
        oRef = False

        if string.find("o.rawData") != -1:
            oRef = True
        elif string.find("o.header") != -1:
            oRef = True
            
        string = string.split("\n")

        openBracket = False
        if oRef:
            for i in range(0, len(string)):
                if (not openBracket):
                    if (string[i].find("{") != -1):
                        openBracket = True
                        string[i] += "\n    var o = gCurrentObject;\n"
                
        string = "\n".join(string)

        string = re.sub(r'(case )(\w+)(\:)', r'\1(\2)\3', string)
        string = string.replace("case (", "case(")

        # remove & refs to vars
        string = re.sub(r'(\&)(\w+)', r'\2', string)

        # replace float fs trailing digits
        string = re.sub(r'(\d+\.?\d+)(f)', r'\1', string)
        string = re.sub(r'(\d\.*\d*)(L)', r'\1', string)

        # replace 'struct N *' refs
        string = re.sub(r'(struct\s\w+\s\*)', 'var ', string);

        # create floor wrapper
        string = string.replace("var floor;", "var floor = {};")

        # replace floor, ceil regs
        underscored = ["floor", "ceil", "gravity",\
                       "room", "health", "score", "lives",
                       "x", "y", "z"]
        string = re.sub(r'(\b)(floor\b|ceil\b|gravity\b|room\b|health\b|score\b|lives\b|x\b|y\b|z\b)',\
            r'_\2', string)

        # revert ._x, ._y, ._z refs
        string = string.replace("._x", ".x").\
            replace("._y", ".y").\
            replace("._z", ".z").\
            replace("._gravity", ".gravity")

        # resolve floor wrappers
        string = string.replace("_floor)", "_floor)\n\t_floor = _floor._floor")

        # fix var array declaration
        string = re.sub(r'(var\s\w+)(\[)(\d+)(\])', r'\1 = array_create(\3)', string)
        

        # write directly to arrays, should they have been passed in as an arg
        for i in range(0, len(cleaned_args)):

            if len(cleaned_args[i].strip(" ")) < 1:
                continue
            
            string = string.replace(cleaned_args[i] + "[", cleaned_args[i] + "[@ ");

            # floor\b|ceil\b|gravity\b|room\b|health\b|score\b|lives\b|x\b|y\b|z\b
            for j in range(0, len(underscored)):
                if (cleaned_args[i] == underscored[j]):
                    cleaned_args[i] = "_" + underscored[j]

            if ("*" + cleaned_args[i]) in string:

                string = string.replace("*" + cleaned_args[i], cleaned_args[i])

                ret_fmt = POINTER_PREFIX + cleaned_args[i] + " = " + cleaned_args[i] + ";\n"

                # prepend pointer before return
                string = string.replace("return ", ret_fmt + "return ")

                # prepend pointer before breaks
                string = string.replace("break;", ret_fmt + "break;")

                # prepend pointer before end if no returns
                if not "return " in string:
                    string = rreplace(string, "}", "\n" + ret_fmt + "}", 1)

        # clean up stacked underscore pointer refs
        string = string.replace("Ptr.p__", "Ptr.p_")

        if not PARTIAL_MODE:
            string = header + jsbeautifier.beautify(string)        

        # clean up rawData.as*32 refs
        string = string.replace(".rawData.as", ".as")

        # oRawData 2d indices
        for i in range(0, len(firstIndices)):
            string = string.replace(firstIndices[i] + "]", firstIndices[i] + "][0]")

        for i in range(0, len(secondIndices)):
            string = string.replace(secondIndices[i] + "]", secondIndices[i] + "][1]")
        
        if PARTIAL_MODE:
            string = string[0:len(string)-1]

        string = string.replace(". f", ".0")

    else:
        print("Unknown type")

    hsh = hashlib.md5(string.encode()).hexdigest()[1:10]

    if not PARTIAL_MODE:
        string = "/// <pygml?v=" + VERSION + "&h=" + hsh + ">\n" + string + "\n"# + "\n/// </pygml>"

    return string

    
if __name__ == "__main__":
    main()
