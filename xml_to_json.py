#!/usr/bin/python3.7
import json
import argparse
import xmltodict

def arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("FILE", help="File in .xml format to convert")
    return parser.parse_args()

def main():
    res = arguments()
    f = open(res.FILE)
    xml_content = f.read()
    f.close()
    print(json.dumps(xmltodict.parse(xml_content), indent=4, sort_keys=True))

if __name__ == "__main__":
    main()
