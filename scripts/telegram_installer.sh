#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
cd /tmp
wget https://tdesktop.com/linux
tar -xf linux
cd Telegram
mv Telegram telegram
mv Updater telegram-updater
mkdir $HOME/.local/bin
cp telegram $HOME/.local/bin/ && cp telegram-updater $HOME/.local/bin/
cd ~/.local/bin
./telegram
