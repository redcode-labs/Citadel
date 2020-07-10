#!/usr/bin/python3.7
import argparse
from bottle import static_file, route, run
import os.path

def arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('DIR', help="Directory to host")
    parser.add_argument('-d', '--debug', dest='DEBUG', help="Print debug messages")
    parser.add_argument('-p', '--port', action="store",
                        default=8080,
                        type=int, metavar="<port>", dest='PORT',
                        help="Port to run server on (default: 8080)")
    parser.add_argument('-bp', '--base-path', action="store",
                        metavar="<path>", dest='BASEPATH',
                        help="Base path of server's files (http://<ip>/<basepath>/<file>) (default: DIR)")
    return parser.parse_args()

def main():
    res = arguments()
    if res.BASEPATH:
        basepath = res.BASEPATH
    else:
        basepath = res.DIR
    @route('<filename>')
    def serve(filename):
        return static_file(filename, root=res.DIR)
    #if res.RUN_LOCALLY:
    #    host = "localhost"
    #else:
    #    host = ""
    run(host="0.0.0.0", port=res.PORT, debug=res.DEBUG)

if __name__ == "__main__":
    main()
