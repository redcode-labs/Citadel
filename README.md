<h1 align="center">  </h1> <br>

<p align="center">
  <a>
    <img alt="Netenum" title="Netenum" src="img/citadel.png">
  </a>
</p>


![Language](https://img.shields.io/badge/Language-Python-blue.svg?longCache=true&style=flat-square)  ![Language](https://img.shields.io/badge/Language-Bash-magenta.svg?longCache=true&style=flat-square) 
   ![License](https://img.shields.io/badge/License-MIT-purple.svg?longCache=true&style=flat-square)   

## Introduction
Citadel is a collection of various scripts that I wrote for use in pentesting-related tasks (but not only, some general purpose code chunks are also present here ;> ).


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





<br>
### vars.zsh
<p align="center">
  <a>
    <img src="img/vars_screen.png">
  </a>
</p>
Exports useful networking variables that can be used directly in terminal. 

<br>
### msf\_resource\_scripts
<p align="center">
  <a>
    <img src="img/msfscripts_screen.png">
  </a>
</p>
This directory contains a few `.rc` files for Metasploit Framework Console that automate certain tasks in the CLI. In order for them to work properly, put all scripts from this directory into your default path containing resource scripts for the framework, then load the main file: `msf5> resource main.rc`.  


<br>
### dnsdump.py
<p align="center">
  <a>
    <img src="img/dnsdump_screen.png">
  </a>
</p>

Downloads an image representation of DNS graph from [dnsdump.com](http://dnsdump.com).

<br>
### fileinfo.zsh
<p align="center">
  <a>
    <img src="img/fileinfo_screen.png">
  </a>
</p>

Presents basic information about selected file.  

<br>
### fileserver.py
<p align="center">
  <a>
    <img src="img/fileserver_screen.png">
  </a>
</p>

Simple file server that exposes a local directory.

<br>
### opcodes.zsh
<p align="center">
  <a>
    <img src="img/opcodes_screen.png">
  </a>
</p>
Extracts opcodes from a binary, and prints them to STDOUT. Useful in shellcode development.

<br>
### stackpush.zsh
<p align="center">
  <a>
    <img src="img/stackpush_screen.png">
  </a>
</p>
Generates assembly instructions that push desired string onto the stack.

<br>
### ssl_convert.zsh
<p align="center">
  <a>
    <img src="img/sslconvert_screen.png">
  </a>
</p>
Performs common OpenSSL file conversions.

<br>
### gitdownload.zsh
<p align="center">
  <a>
    <img src="img/gitdownload_screen.png">
  </a>
</p>
Downloads a single file from a Github repository.





## License
This software is under [MIT License](https://en.wikipedia.org/wiki/MIT_License)


