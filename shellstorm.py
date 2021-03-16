#!/usr/bin/python3.7
import argparse
import requests #HTTP library
from terminaltables import SingleTable #Library for printing beautiful tables
import subprocess
from huepy import * #Coloring library, install it with pip3 install huepy
import re #Regex library

def arguments():
    parser = argparse.ArgumentParser(prog="shellstorm")
    #Main argument - those are the keywords that you pass to the api
    #nargs="*" explicitly states that number of words passed can be >= 1
    #we can pass a single ID as a keyword to momentally download desired shellcode
    parser.add_argument('KEYWORDS', nargs="*", help="Specify the keywords for shellcode search")

    #results are written to file specified by that string flag
    parser.add_argument("-w", "--write", type=str, help="Write selected shellcode to the file")

    #boolean flag: returns true if specified, and false otherwise
    parser.add_argument("-x", "--extract", action="store_true", help="Extract raw shellcode bytes")
    return parser.parse_args()


def extract(string, extract_flag):
    if extract_flag:
        string = "".join(re.findall(r"x[a-f0-9][a-f0-g]", string)) #Regex to find all "x<byte><byte>" values
        string = string.replace("x", "") #Removes trailing hex
        return string
    else:
        return string #If no "--extract" was passed, returns original string

def main():
    res = arguments()
    if not res.KEYWORDS[0].isdigit():#This condition states that no ID was passed, but keywords 
        r = requests.get('http://shell-storm.org/api/?s={}'.format('*'.join(res.KEYWORDS)))
        shellcodes = r.text.splitlines()
        found = len(shellcodes)
        table_data = [["--TITLE--", '--PLATFORM--', '--ID--', '--AUTHOR--', '--URL--']]
        for shellcode in shellcodes:
            sc = shellcode.split('::::') #Returned results are splitted with "::::" - this is how API returns them
            table_data.append([blue(sc[2]), sc[1], red(sc[3]), sc[0], sc[4]])
        table = SingleTable(table_data)
        table_instance = SingleTable(table_data)   #Table init sequence and formatting setup 
        table_instance.inner_heading_row_border = True
        table_instance.inner_row_border = False
        table_instance.justify_columns = {0: 'left', 1: 'left', 2: 'left'} #Columns orientation setup
        print()
        print(green(f"[*] {found} results found"))
        print()
        print(table_instance.table)
        shellcode_id = input(green("[*] Select shellcode id: ")) #Asks for ID of the shellcode we want to download
        subprocess.call("clear", shell=True) #Clears terminal, so results look better
        shellcode = requests.get('http://shell-storm.org/shellcode/files/shellcode-{}.php'.format(shellcode_id)).text #Retrieves the shellcode using GET request
        shellcode = shellcode.replace("&quot;", '"')#Here, non UTF-8 compliant quotation marks are removed, so the file looks clearer
        shellcode = extract(shellcode, res.extract) #If --extract was passed, only raw bytes are outputed later
        print(blue(shellcode)) #Prints obtained shellcode
        if res.write: #Checks if the shellcode should be written to file
            fil = open(res.write, "w+") #File is opened her with extended write permissions ("w+")
            fil.write(shellcode)
            print(f"[*] Wrote shellcode #{shellcode_id} to the file")
    else:#This gets executed if a single ID was passed
        #subprocess.call("clear", shell=True)
        shellcode = requests.get('http://shell-storm.org/shellcode/files/shellcode-{}.php'.format(res.KEYWORDS[0])).text
        shellcode = shellcode.replace("&quot;", '"')
        shellcode = extract(shellcode, res.extract)
        print(blue(shellcode))
        if res.write:
            fil = open(res.write, "w+")
            fil.write(shellcode)
            print(f"[*] Wrote shellcode #{shellcode_id} to the file")

if __name__ == "__main__":
    main()

