#!/bin/bash
echo
clear
figlet UserBot FTG | lolcat
echo
echo
echo "BOT RODANDO..." | lolcat
echo
sleep 2
echo
cd ~/.Git/friendly-telegram && python3 -m friendly-telegram
