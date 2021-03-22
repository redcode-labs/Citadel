<h1 align="center">  </h1> <br>

<p align="center">
  <a>
    <img alt="Netenum" title="Netenum" src="img/citadel.png">
  </a>
</p>


![Language](https://img.shields.io/badge/Language-Python-blue.svg?longCache=true&style=flat-square)  ![Language](https://img.shields.io/badge/Language-Bash-magenta.svg?longCache=true&style=flat-square) 
   ![License](https://img.shields.io/badge/License-MIT-purple.svg?longCache=true&style=flat-square)   

## Introduction
Citadel is a collection of various scripts for pentest-related tasks.


## List of scripts included
- [vars.zsh](#vars.zsh)
- [msf\_resource\_scripts](#msf_resource_scripts)
- [dnsdump.py](#dnsdump.py)
- [fileinfo.zsh](#fileinfo.zsh)
- [fileserver.py](#fileserver.py)
- [opcodes.zsh](#opcodes.zsh)
- [stackpush.zsh](#stackpush.zsh)
- [ssl_convert.zsh](#ssl_convert.zsh)
- [gitdownload.zsh](#gitdownload.zsh)
- [cardmon.zsh](#cardmon.zsh)
- [powershell\_cmd\_stager.py](#powershell_cmd_stager.py)
- [sf_parser.py](#sf_parser.py)
- [xml\_to_json.py](#xml_to_json.py)
- [enum_forms.py](#enum_forms.py)
- [linker.sh](#linker.sh)
- [init_commit.sh](#init_commit.sh)
- [shellstorm.py](#shellstorm.py)






## vars.zsh
<p align="center">
  <a>
    <img src="img/vars_screen.png">
  </a>
</p>
Exports useful networking variables that can be used directly in terminal. 


## msf\_resource\_scripts
<p align="center">
  <a>
    <img src="img/msfscripts_screen.png">
  </a>
</p>
This directory contains a few `.rc` files for Metasploit Framework Console that automate certain tasks in the CLI. In order for them to work properly, put all scripts from this directory into your default path containing resource scripts for the framework, then load the main file: `msf5> resource main.rc`.  

## sf_parser.py
<p align="center">
  <a>
    <img src="img/sf_parser_screen.png">
  </a>
</p>
Pretty-print results of a SpiderFoot scan

## dnsdump.py
<p align="center">
  <a>
    <img src="img/dnsdump_screen.png">
  </a>
</p>

Downloads an image representation of DNS graph from [dnsdump.com](http://dnsdump.com).


## fileinfo.zsh
<p align="center">
  <a>
    <img src="img/fileinfo_screen.png">
  </a>
</p>

Presents basic information about selected file.  


## fileserver.py
<p align="center">
  <a>
    <img src="img/fileserver_screen.png">
  </a>
</p>

Simple file server that exposes a local directory.


## opcodes.zsh
<p align="center">
  <a>
    <img src="img/opcodes_screen.png">
  </a>
</p>
Extracts opcodes from a binary, and prints them to STDOUT. Useful in shellcode development.


## stackpush.zsh
<p align="center">
  <a>
    <img src="img/stackpush_screen.png">
  </a>
</p>
Generates assembly instructions that push desired string onto the stack.


## ssl_convert.zsh
<p align="center">
  <a>
    <img src="img/sslconvert_screen.png">
  </a>
</p>
Performs common OpenSSL file conversions.


## gitdownload.zsh
<p align="center">
  <a>
    <img src="img/gitdownload_screen.png">
  </a>
</p>
Downloads a single file from a Github repository.


## cardmon.zsh
<p align="center">
  <a>
    <img src="img/cardmon_screen.png">
  </a>
</p>
Quickly switch between modes of a network interface.

## powershell\_cmd_stager.py
<p align="center">
  <a>
    <img src="img/powershell_cmd_stager_screen.png">
  </a>
</p>
Creates a command stager that will execute provided Powershell script

## xml\_to_json.py
<p align="center">
  <a>
    <img src="img/xml_to_json_screen.png">
  </a>
</p>
Converts a .xml file to JSON

## enum_forms.py
<p align="center">
  <a>
    <img src="img/enum_forms_screen.png">
  </a>
</p>
Scrapes forms from URL


## linker.sh
Creates symbolic links under '.' for all executables found in given directory

## init_commit.sh
Creates a .git repository and pushes all files to remote

## shellstorm.py
<p align="center">
  <a>
    <img src="img/shellstorm_screen.png">
  </a>
</p>
Searches for shellcodes using Shellstorm API. You can extract raw bytes of the shellcode and write it to a file


## License
This software is under [MIT License](https://en.wikipedia.org/wiki/MIT_License)


