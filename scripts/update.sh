#!/bin/bash
#
# Script para atualizar o sisteam
# Credits: Franklin Souza
# Telegram: @FranklinTech

echo Atualizando o sistema FULL
echo
echo Atualizando... AGUARDE
echo
echo Digite sua senha SUDO SE PEDIR
echo
sudo pacman -Syy && yay -Syu
echo
echo Atualização completa...SAINDO
exit
