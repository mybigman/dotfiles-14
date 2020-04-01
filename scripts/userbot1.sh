#!/bin/bash
echo
figlet UserBOT FTG | lolcat
echo
echo "Deseja abrir o UserBOT FTG no Telegram?"
echo
echo "1 - Sim"
echo "2 - Não"
echo
read ALT
echo
if [ "$ALT" = "1" ];then
	echo "Abrindo o userBOT FTG..."
	clear
	echo "BOT RODANDO..." | lolcat
	cd ~/.aur/friendly-telegram && python3 -m friendly-telegram
fi
