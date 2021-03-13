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


#iface=`ip addr show | awk '/inet.*brd/{print $NF}'`
iface=$(ip addr show|grep default|grep -i up|grep -vi loopback|tail -1|awk '{print $2}'|sed 's/:/'/)
hostname=`cat /etc/hostname`
ip_re="(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
mac_re="\w\w:\w\w:\w\w:\w\w:\w\w:\w\w"
ip_loopback="127.0.0.1"
ip_local=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`
ip_global=`curl -s http://whatismyip.akamai.com/`
ip_gateway=`ip route show 0.0.0.0/0 dev $iface | cut -d\  -f3`
network=`iwconfig wlp3s0 | grep ESSID | awk -F: '{print $2}' 2>/dev/null` 
network=`echo $network|tr -d \"`
subnet=`ip -o -f inet addr show | awk '/scope global/ {print $4}'`

if [[ "$@" =~ .*-h.* ]]; then
	echo "$red$bold#$reset Available variables:"
    echo "\t\$iface         $bold$green-$reset Name of the curently active wireless network interface ($bold$iface$reset)"
    echo "\t\$hostname      $bold$green-$reset Hostname of the machine ($bold$hostname$reset)"
    echo "\t\$ip_re         $bold$green-$reset Regex for IP address "
    echo "\t\$mac_re        $bold$green-$reset Regex for MAC address"
    echo "\t\$ip_loopback   $bold$green-$reset Loopback IP address ($bold$ip_loopback$reset)"
    echo "\t\$ip_local      $bold$green-$reset Local IP address on the current network ($bold$ip_local$reset)"
    echo "\t\$ip_global     $bold$green-$reset Global IP address ($bold$ip_global$reset)"
    echo "\t\$ip_gateway    $bold$green-$reset IP address of the gateway ($bold$ip_gateway$reset)"
    echo "\t\$network       $bold$green-$reset Name of the currently used network ($bold$network$reset)"
    echo "\t\$subnet        $bold$green-$reset Current network segment in CIDR notation ($bold$subnet$reset)"
    echo
fi

