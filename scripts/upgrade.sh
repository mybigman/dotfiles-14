#!/bin/sh
#echo Inf atual: date +%a %d/%b - %H:%M:%S
echo "By: Franklin Souza"
echo
echo "By: @FranklinTech"
echo
echo "Atualizar Arch Linux e AUR"
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
	echo "Seu Arch Linux e AUR irão atualizar...AGUARDE"
	sleep 1
	echo
	echo "Digite sua senha SUDO se pedir:"
	echo
	yay -Syyuu 
	echo
	echo "Arch Linux atualizado com sucesso...SAINDO!!!"
	sleep 2 && exit
else
	echo "Atualização abortada ARCH LINUX NÃO ATUALIZADO...SAINDO!!!"
	sleep 2 && exit
fi
