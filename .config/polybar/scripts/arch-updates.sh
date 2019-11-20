#!/bin/sh

# Credit: Franklin Souza
# Telegram: @FranklinTech

# Script para verificar atualizações no Arch Linux

if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "# $updates"
else
    echo ""
fi
