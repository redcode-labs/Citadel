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
        echo "\tssl <subcommand>"
        echo "Description:"
        echo "\tPerform common OpenSSL conversions and operations"
        echo "Arguments:"
        echo "\tsubcommand - subcommand to run"
        echo "Available subcommands"
        echo "\t* pem-der <file.pem> <file.der>                        - convert .pem to .der certificate"
        echo "\t* der-pem <file.der> <file.pem>                        - convert .der to .pem certificate"
        echo "\t* pem-p7b <file.pem> <file.der> <CA.cer>               - convert .pem to .p7b certificate"
        echo "\t* pem-pfx <file.pem> <file.pfx> <CA.cer> <private.key> - convert .pem to .pfx certificate"
        return
    fi
    if [ $# -eq 0 ]; then
        print_error "Specify subcommand"
        return
    fi
    subcommand=$1
    if [ "$subcommand" = "pem-der" ]; then
        required_arguments=3 #The number of required arguments = subcommand + it's arguments
        if [ $# -lt $required_arguments ]; then
            print_error "Not enough arguments"
            return
        fi 
        pem_file=$2
        der_file=$3
        openssl x509 -outform der -in $pem_file -out $der_file
    elif [ "$subcommand" = "der-pem" ]; then
        required_arguments=3 #The number of required arguments = subcommand + it's arguments
        if [ $# -lt $required_arguments ]; then
            print_error "Not enough arguments"
            return
        fi 
        der_file=$2
        pem_file=$3
        openssl x509 -inform der -in $der\ -out $pem_file
    elif [ "$subcommand" = "pem-p7b" ]; then
        required_arguments=4
        if [ $# -lt $required_arguments ]; then
            print_error "Not enough arguments"
            return
        fi 
        pem_file=$2
        p7b_file=$3
        ca_file=$4
        openssl crl2pkcs7 -nocrl -certfile $pem_file -out $p7b_file -certfile $ca_file
    elif [ "$subcommand" = "pem-pfx" ]; then
        required_arguments=5
        if [ $# -lt $required_arguments ]; then
            print_error "Not enough arguments"
            return
        fi 
        pem_file=$2
        pfx_file=$3
        ca_file=$4
        key_file=$5
        openssl pkcs12 -export -out $pfx_file -inkey $key_file -in $pem_file -certfile $ca_file 
    else
        print_error "No such subcommand"
        return
    fi
