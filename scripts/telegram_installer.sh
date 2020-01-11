#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
cd /tmp
wget https://tdesktop.com/linux
tar -xf linux
cd Telegram
mv Telegram telegram
mv Updater telegram-updater
sudo cp telegram /usr/local/bin/ && sudo cp telegram-updater /usr/local/bin/
cd ~
telegram
