import re

VERSION = "VERSION_US"

def version_trim(s):

    lines = s.split('\n')

    preserve_lines = []

    inside_true = True
    inside_at_else = False
    
    for l in lines:

        nopush = False

        #ifdef
        if re.match(r'(#\bifdef)', l):
            nopush = True
            if VERSION in l:
                inside_true = True
                inside_at_else = False
            else:
                inside_true = False
                inside_at_else = True

        #ifndef
        elif re.match(r'(#\bifndef)', l):
            nopush = True
            if VERSION in l:
                inside_true = False
                inside_at_else = True
            else:
                inside_true = True
                inside_at_else = False           

        #else
        elif re.match(r'(#\belse)', l):
            nopush = True
            if inside_at_else:
                inside_true = True
            else:
                inside_true = False
            inside_at_else = False

        #endif
        elif re.match(r'(#\bendif)', l):
            nopush = True
            inside_true = True
            inside_at_else = False

        # decomp-specific patches, assume NO
        elif re.match(r'(#\bif\s)', l):
            nopush = True
            inside_true = False
            inside_at_else = True

        if inside_true:
            if not nopush:
                preserve_lines.append(l)
            nopush = False

                
    s = '\n'.join(preserve_lines)

    return s