#!/usr/bin/python3.7
import sys
import argparse
from huepy import *
from terminaltables import SingleTable
import json

def arguments():
    parser = argparse.ArgumentParser(prog="sf_parser")
    parser.add_argument("FILE", help="JSON file with SpiderFoor's output to parse")
    return parser.parse_args()

def main():
    res = arguments()
    json_content = json.load(open(res.FILE))
    table_data = [["SOURCE", "TYPE", "DATA"]]
    for result in json_content:
        table_data.append([red(result["source"]), blue(result["type"]), result["data"]])
    table_instance = SingleTable(table_data) 
    table_instance.inner_heading_row_border = True
    table_instance.inner_row_border = False
    table_instance.justify_columns = {0: 'left', 1: 'left', 2: 'left'}
    print(f"\n[*] Entries found: {len(json_content)}")
    print(table_instance.table)
    print("")



if __name__ == "__main__":
    main()

