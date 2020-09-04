#!/usr/bin/python3.7
from huepy import *
import argparse
from terminaltables import SingleTable as st
import requests
from zetanize import zetanize

def arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("URL", help="Url to search forms in")
    return parser.parse_args()

def main():
    res = arguments()
    resp_text = requests.get(res.URL).text
    json_forms = zetanize.zetanize(resp_text)[0]
    action = json_forms["action"]
    forms_num = len(json_forms["inputs"])
    table_data = [["NAME", "VALUE", "TYPE"]]
    for form in json_forms["inputs"]:
        table_data.append([green(form["name"]), form["value"], form["type"]])
    info("Action: {}".format(action))
    info("Found {} forms".format(forms_num))
    print("") 
    table = st(table_data)
    print(table.table)

if __name__ == "__main__":
    main()
