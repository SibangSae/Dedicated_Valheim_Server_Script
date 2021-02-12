#!/bin/bash
# Easy Valheim Server Menu
# Open to other commands that should be used... 
clear
##
# System script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP/UDP connections 
#   - Kernel version
##

##
# Server Install:
#   - Install Server
##

##
# Server Tools:
#   - List Admins
#   - Add Admin
#   - Remove Admin

##

server_name=$(hostname)

function memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

function cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

function tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function udp_check() {
    echo ""
	echo "UDP connections on ${server_name}: "
    echo ""
	cat  /proc/net/udp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

function confirmed_valheim_install() {
	echo "Installing Valheim"
	echo "Oh for Loki, its starting"
	echo "This will work add code later"
	echo ""
}

function valheim_server_install() {
    echo ""
    read -p "Are you sure? " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    [[ "$0" = "$confirmed_valheim_install" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
  fi

}


function valheim_update_check() {
    echo ""
	echo "Checking for Valheim Server Updates "
	echo "This will work add code later"
	echo ""
    echo ""
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	udp_check
	kernel_check
}

##
# Color  Variables
##

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
CLEAR='\e[0m'


##
# Color Functions
##
ColorRed(){
	echo -ne $RED$1$CLEAR
}
ColorGreen(){
	echo -ne $GREEN$1$CLEAR
}
ColorOrange(){
	echo -ne $ORANGE$1$CLEAR
}
ColorBlue(){
	echo -ne $BLUE$1$CLEAR
}
ColorPurple(){
	echo -ne $PURPLE$1$CLEAR
}
ColorCyan(){
	echo -ne $CYAN$1$CLEAR
}
ColorLightRed(){
	echo -ne $LIGHTRED$1$CLEAR
}
ColorLightGreen(){
	echo -ne $LIGHTGREEN$1$CLEAR
}
ColorYellow(){
	echo -ne $LIGHTYELLOW$1$CLEAR
}
ColorWhite(){
	echo -ne $WHITE$1$CLEAR
}

server_menu(){
echo -ne "
$(ColorOrange '-----Server System Information-----')
$(ColorGreen '1)') Sub Menu Test Install Valheim Server
$(ColorGreen '0)') Go to Main Menu
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) valheim_server_install ; server_menu ;;
           	    0) menu ; menu ;;
		    *) echo -e $RED"Wrong option."$CLEAR; WrongCommand;;
        esac
}

menu(){
echo -ne "
$(ColorOrange '~*~*~*~*Valheim Toolbox Menu*~*~*~*~')
$(ColorOrange '-----Server System Information-----')
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections 
$(ColorGreen '4)') Number of UDP connections 
$(ColorGreen '5)') Kernel version
$(ColorGreen '6)') Check All
$(ColorOrange '-----Valheim Server Commands-----')
$(ColorGreen '7)') Install Valheim Server
$(ColorGreen '8)') Valheim Server Update Check
$(ColorGreen '9)') Server Sub Menu Test
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) memory_check ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) udp_check ; menu ;;
	        5) kernel_check ; menu ;;
	        6) all_checks ; menu ;;
		    7) valheim_server_install ; menu ;;
	    	8) valheim_update_check ; menu ;;
		9) server_menu ; menu ;;
		    0) exit 0 ;;
		    *) echo -e $RED"Wrong option."$CLEAR; WrongCommand;;
        esac






}



# Call the menu function
menu