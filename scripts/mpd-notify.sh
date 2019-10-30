#!/bin/bash
#
# Um script pra mostrar a notificação e capa do albúm da sua música
#
# Credits: Franklin Souza
#
#Telegram: @FranklinTech
while true
do
    mpc idle player

    NOTIFY_TITLE="Now Playing"
    echo
    MUSIC=$(mpc current)

    echo "$MUSIC"

    ART="$HOME/Música/$(dirname "$(mpc status -f '%file%' | head -n1)")/cover.jpg"
    convert -resize 64x64 "$ART" /tmp/cover.png

    dunstify -u low -t 5000 -a MPD -r 1 -i "/tmp/cover.png" "$NOTIFY_TITLE"  "$MUSIC"
done
