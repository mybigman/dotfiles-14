#!/bin/bash
echo
clear
figlet UserLixo | lolcat
echo
echo
echo "BOT RODANDO..." | lolcat
echo
sleep 2
echo
cd ~/.Git/UserLixo && python3 bot.py
