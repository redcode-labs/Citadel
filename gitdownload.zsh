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

if [[ "$@" =~ .*-h.* ]]; then
        echo "Usage:"
        echo "\tgitdownload USERNAME REPOSITORY FILE"
        echo "Description:"
        echo "\tDownload a single file from a Github repository"
        echo "Arguments:"
        echo "\tusername   - user that owns the repository"
        echo "\trepository - name of the repository"
		echo "\tfile	   - file to download"
        return
else
	if [ $# -eq 0 ]; then
        print_error "Specify the USER"
	elif [ $# -eq 1 ]; then
        print_error "Specify the REPO"
	elif [ $# -eq 2 ]; then
        print_error "Specify the FILE"
	else
		user=$1
		repo=$2
		file=$3
		curl -LJO https://github.com/$user/$repo/raw/master/$file
		print_good "Downloaded $file ($(wc -c < $file) bytes)"
	fi
fi
