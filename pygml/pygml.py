import re, json

TEST_INPUT = """
C CODE GOES HERE
"""

DIR_JSON = 'dict.json'
DICT = ""

RAW_DATA = "rawData"
RAW_DATA_WRAP = RAW_DATA + "[%s]"
KWD_LOWER = "keywordLowercase"
OREPLACEMENT = "gCurrentObject"

# returns the type of the function
def function_get_return_type(string):

    ret = re.search(r'(\b.*)(\()', string).group()
    ret = ret.split(" ")
    ret = ret[0:len(ret)-1]
    
    return ret

# returns the name of the function
def function_get_name(string):

    ret = re.search(r'(\b.*)(\()', string).group(1)
    ret = ret.split(" ")[-1]
    
    return ret

# returns the arguments of the function
def function_get_args(s):

    ret = s[s.find("(")+1:s.find(")")].split(",")

    args = []
    for r in ret:
        r = r.replace("\n", " ").replace("\r", " ").strip(" ")

        arg_str = r.split(" ")[-1]

        # determine if pointer
        is_ptr = False

        if ("*" in r):
            if (not re.match(r'(\b)(struct)(\b)', r)):
                is_ptr = True

        arg_str = re.sub('[^0-9a-zA-Z]+', '', arg_str)
        
        args.append([arg_str, is_ptr])

    return args

# gCurrentObject ref
def covert_o_gCurrentObject(string):

    string = re.sub(r'(\bo\b)', OREPLACEMENT, string)
    
    return string

# float removals
def convert_float_trunc(string):

    string = re.sub(r'(\d\.\d*)(f)', r'\1', string)
    
    return string
    
# dot references
def convert_dot_refs(string):
    string = string.replace("->", ".")
    return string

# lowercase casting
def convert_lowercase(string):
    lst = DICT[KWD_LOWER]

    for l in lst:
        string = string.replace(l.upper(), l)

    return string
    
# primary function conversion
def convert(s):

    s = convert_rawData(s)
    s = convert_dot_refs(s)
    s = convert_float_trunc(s)
    s = convert_lowercase(s)
    #s = covert_o_gCurrentObject(s)

    ret = function_get_return_type(s)
    name = function_get_name(s)
    args = function_get_args(s)

    print(args)

    #print(s)

# rawData references
def convert_rawData(string):
    
    raw = DICT[RAW_DATA][0]["array0"] +\
          DICT[RAW_DATA][0]["array1"]
    for r in raw:
        string = re.sub(r'(\b)('+r+')',\
            RAW_DATA_WRAP % r'\2', string)    

    return string

# init JSON dictionary
def init_dict():
    global DICT
    with open(DIR_JSON) as f:
        DICT = json.load(f)
        
# main func
def main():
    init_dict()

    convert(TEST_INPUT)

if __name__ == "__main__":
    main()
