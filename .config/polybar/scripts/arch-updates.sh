#!/bin/sh

# Script para Polybar mostrar atualizações do Arch Linux

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

updates=$(("$updates_arch"))

if [ "$updates" -gt 0 ]; then
    echo "Updates: $updates"
else
    echo "No updates"
fi
