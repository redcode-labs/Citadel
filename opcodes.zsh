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
        echo "\topcodes <file> [<format>]"
        echo "Description:"
        echo "\tExtract opcodes from an executable file using objdump"
        echo "Arguments:"
        echo "\tfile   - file to extract opcodes from"
        echo "\tformat - output format [*hex|bytes]"
        return
    fi    
    format="hex"
    file=$1
    if [ $# -eq 0 ]; then
        print_error "Specify file"
        return
    fi
    if [ $# -eq 2 ]; then
        format=$2
    fi
    if [ $? -eq 1 ]; then
        return
    fi
    if [ "$format" = "hex" ]; then
        objdump -d $file | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
    else
        objdump -d $file | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^//g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
    fi
