import re, os

INPUT = "../include/object_fields.h"
OUTPUT = "../object_fields_output.txt"

def main():
    with open(INPUT, 'r') as f:
        txt = f.read()

    res = re.finditer(r'(#define.*)(\bo[A-Z]\w*\b)', txt)

    s = ""
    for r in res:
        s += r.group(2) + "\n"

    with open(OUTPUT, 'w') as f:
         f.write(s)

    print("Done writing " + OUTPUT)
          
if __name__ == "__main__":
    main()