#!/usr/bin/python3.7
import argparse
import requests
import shutil

def arguments():
    parser = argparse.ArgumentParser(prog="dnsdump")
    parser.add_argument("DOMAIN", help="Domain to query") 
    parser.add_argument("OUTFILE", nargs="?", help="Name of the image file to save (default: <domain>_dnsdump.jpg)") 
    return parser.parse_args()

def main():
    res = arguments()
    url = f"https://dnsdumpster.com/static/map/{res.DOMAIN}.png"
    image_filename = res.DOMAIN.split(".")[0]+"_dnsdump.png"
    if res.OUTFILE:
        image_filename = res.OUTFILE
    r = requests.get(url, stream=True)
    if r.status_code == 200:
        with open(image_filename, "wb") as f:
            r.raw.decode_content = True
            shutil.copyfileobj(r.raw, f)
            f.close()
    print(f"[*] Saved {res.DOMAIN} DNS dump in {image_filename}")

if __name__ == "__main__":
    main()
