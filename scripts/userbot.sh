#!/bin/bash
echo
figlet UserBot FTG | lolcat
echo
echo
echo "Iniciando o bot no Telegram..."
sleep 4
echo
echo "Bot iniciado com sucesso!!!"
echo
sleep 2 && clear
echo
echo "BOT RODANDO..." | lolcat
echo
cd ~/.Git/friendly-telegram && python3 -m friendly-telegram
