#!/usr/bin/zsh
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
print_usage(){
	echo "Usage: cardmon.sh [-h] IFACE [on|off] [CHANNEL]"
}

while getopts "h" opt; do
	case "$opt" in 
    h)
        print_usage
        exit 0
		;;
	esac
done

iface=$1
state=$2
channel=$3

if [ "$#" -eq 0 ]; then
	print_error "Specify interface"
	exit 0
fi

if [[ "`iwconfig`" =~ .*$iface.* ]]; then
	:
else
	print_error "No such interface: $iface"
	exit 0
fi

if [ "$#" -eq "1" ]; then #Fix this length
	iwconfig_out=`iwconfig $iface`
	if [[ "$iwconfig_out" =~ .*Monitor.* ]]; then
		print_info "Monitor mode is ${green}ENABLED${reset} on $iface"
	else
		print_info "Monitor mode is ${red}DISABLED${reset} on $iface"
	fi
elif [ "$#" -eq "2" ]; then
	ifconfig $iface down
	if [ "$state" == "on" ]; then
		iwconfig $iface mode monitor
		print_info "Started monitor mode on $iface"
	elif [ "$state" == "off" ]; then
		iwconfig wlp3s0 mode managed
		print_info "Started managed mode on $iface"
	else
		print_error "No such state (use [on|off])"
	fi
	ifconfig $iface up
elif [ "$#" -eq "3" ]; then
	ifconfig $iface down
	iw dev $iface set channel $channel
	ifconfig $iface up
	print_info "Set channel of $iface to $channel"
fi



		
	
