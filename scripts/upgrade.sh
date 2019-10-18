#!/bin/bash
echo
echo "By: Franklin Souza"
echo
echo "By: @FranklinTech"
echo
echo "Atualizar Arch Linux"
echo
echo "Deseja atualiza seu Arch Linux agora?"
echo
echo "1 ➤ Sim"
echo
echo "2 ➤ Não"
echo
read ALT
echo
if [ "$ALT" = "1" ];then
	echo "Seu Arch Linux irá atualizar...AGUARDE"
	sleep 1
	echo
	echo "Digite sua senha SUDO se pedir:"
	echo
	sudo pacman -Syu
	echo
	echo "Arch Linux atualizado com sucesso...SAINDO!!!"
	sleep 2 && exit
else
	echo "Atualização abortada ARCH LINUX NÃO ATUALIZADO...SAINDO!!!"
	sleep 2 && exit
fi
