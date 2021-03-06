#!/bin/bash

TAB=""
PHOTO="$HOME/Franks/Wallpapers/136.png"
COLOR="\e[1;38;05;32m"

OS=$(echo "Arch Linux")
#OS=$(inxi -S)
#Weather=$(inxi -w)
#KERNEL=$(uname -r | sed 's/-[[:alpha:]]*$//')
KERNEL=$(uname -r)
RESOLUTION=$(xrandr | awk '/*+/{print $1}')
PACKAGES=$(pacman -Qq | wc -l)

#UPTIME=$(awk '{printf("%i Hour(s), %i Minute(s)", ($1/60/60%24), ($1/60%60))}' /proc/uptime)
#CPU=$(cat /proc/cpuinfo | sed -n '5p' | awk '{print $4, $5, $6, $7, $8, $9}')
#GPU=$(inxi -G)
#MEM=$(free -m | awk '/Mem/{print $3"MiB", $2"MiB"}'OFS=' / ')
MEM=$(inxi -m)

clear

echo
echo -e " ${TAB} ${COLOR}$USER@$(uname -n)\033[0m"
echo -e " ${TAB} ----------"
echo -e " ${TAB} ${COLOR}OS\033[0m: $OS"
echo -e " ${TAB} ${COLOR}Kernel\033[0m: $KERNEL"
echo -e " ${TAB} ${COLOR}Resolution\033[0m: $RESOLUTION"
echo -e " ${TAB} ${COLOR}Packages\033[0m: $PACKAGES"
echo -e " ${TAB} ${COLOR}Shell\033[0m: $SHELL"
echo
#echo -e " ${TAB} ${COLOR}Uptime\033[0m .....: $UPTIME"
#echo -e " ${TAB} ${COLOR}Cpu\033[0m ........: $CPU"
#echo -e " ${TAB} ${COLOR}Gpu\033[0m ........: $GPU"
#echo -e " ${TAB} ${COLOR}Mem\033[0m ........: $MEM"
#echo -e " ${TAB} ${COLOR}Clima\033[0m ........: $Weather"
#echo
echo -e " ${TAB}  \033[1;31m███\033[1;32m███\033[1;33m███\033[1;34m███\033[1;35m███\033[1;36m███"
echo
echo

# Config Width, Height, X, Y
#POS="40x58+0+3"
#printf "\e]20;${PHOTO};${POS}\a"
