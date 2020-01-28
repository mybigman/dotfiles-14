#!/bin/bash
#
# Informações do sistema
# Kernel, CPUs, Memória e Uptime
# -
# Franklin Souza
#
# @FranklinTech
#
KERNEL=$(uname -r)
PACKAGES=$(pacman -Qq | wc -l)
PROCESSADOR_NOME=$(grep 'model name' /proc/cpuinfo | tail -n 1 | cut -d':' -f 2 | sed 's/^ //g')
PROCESSADOR_CORES=$(grep 'cpu cores' /proc/cpuinfo | tail -n 1 | cut -d':' -f 2 | sed 's/^ //g')

MEMORIA_TOTAL_KB=$(grep MemTotal /proc/meminfo | grep -Eo '[0-9]{1,}')
MEMORIA_TOTAL_MB=$(echo $MEMORIA_TOTAL_KB / "1024" | bc)
SWAP_TOTAL_KB=$(grep SwapTotal /proc/meminfo | grep -Eo '[0-9]{1,}')
#SWAP_TOTAL_MB=$(echo $SWAP_TOTAL_KB / "1024" | bc)

UPTIME_S=$(cut -d' ' -f 1 /proc/uptime)
UPTIME_MIN=$(uptime --pretty | sed 's/up //; s/\ days\?,/d/; s/\ hours\?,\?/h/; s/\ minutes\?/m/')

clear
echo -e "+----------------------------------------------------------+"
echo -e "|                  INFORMAÇÕES DO SISTEMA                  |"
echo -e "+----------------------------------------------------------+"
echo -e
echo -e "  Distribuição.......: "Arch Linux""
echo -e "  Pacotes.......: "$PACKAGES ""
echo -e "  Uptime.......: "$UPTIME_MIN" minutos"
echo -e "  Shell.......: "$SHELL""
echo -e "  Kernel.......: "$KERNEL"\n"
echo -e "  Processador..: "$PROCESSADOR_NOME
echo -e "  Cores.........: "$PROCESSADOR_CORES"\n"
echo -e "  Memória......: "$MEMORIA_TOTAL_KB" KB"
#echo -e "  Memória......: "$MEMORIA_TOTAL_MB" MB"
echo -e "  Memória Swap.: "$SWAP_TOTAL_KB" KB"
#echo -e "  Memória Swap.: "$SWAP_TOTAL_MB" MB\n"
echo -e "+----------------------------------------------------------+"
