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
        echo "\tfileinfo file"
        echo "Description:"
        echo "\tShow general information about a file"
        echo "Arguments:"
        echo "\tfile - file to inspect"
        return
    fi     
    file=$1
    if [ $# -eq 0 ]; then
        print_error "Specify file"
        return
    fi
    if [ $? -eq 1 ]; then
        return
    fi
    if [[ -x "$file" ]]; then
        executable="${green}yes${reset}"
    else
        executable="${red}no${reset}"
    fi
    echo "
    ${green}*${reset}NAME:            $file
    ${green}*${reset}CREATION DATE:   $(stat -c %y $file| sed 's/^\([0-9\-]*\).*/\1/')
    ${green}*${reset}PERMISSIONS:     $(stat -c "%a" $file)
    ${green}*${reset}SIZE:            $(numfmt --to=iec-i --suffix=B --format="%.3f" $(stat --printf="%s" $file))
    ${green}*${reset}EXECUTABLE:      ${executable}
    ${green}*${reset}ENCODING:        $(file -bi $file)
    "
