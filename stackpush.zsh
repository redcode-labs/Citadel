#!/bin/zsh
    
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
grey=`tput setaf 8`
reset=`tput sgr0`
bold=`tput bold`
underline=`tput smul`

print_good(){
    echo "${green}[+]${reset}" $1
}

print_error(){
    echo "${red}[x]${reset}" $1
}

print_info(){
    echo "[*]" $1
}

print_warning(){
    echo "${yellow}[!]${reset}" $1
}

if [[ "$@" =~ .*-h.* ]]; then
    echo "Usage:"
    echo "\tstackpush <string>"
    echo "Description:"
    echo "\tFormat a string in assembly pish instructions"
    echo "Arguments:"
    echo "\tstring - string to push"
fi

string=$1
if [ $# -eq 0 ]; then
	print_error "Specify string"
   	return
fi
echo -en "$string" | hexdump -v -e '1/4 "push 0x%08x\n"' | tac


