#!/bin/bash
#
# Um script pra mostrar a notificação e capa do álbm da sua música 
#
# Criador: Jairo Abreu, Telegram: @jairoabreeu
#
# Credits: Franklin Souza, Telegram: @FranklinTech
#
while true
do
    mpc idle player

    NOTIFY_TITLE="Tocando Agora"

    MUSIC=$(mpc current -f "%artist%[ (%album%)] - %date% \\n%title%")

    echo "$MUSIC"

    ART="/home/jairo/Music/$(dirname "$(mpc status -f '%file%' | head -n1)")/cover.jpg"
    convert -resize 64x64 "$ART" /tmp/cover.png

    dunstify -u low -t 5000 -a MPD -r 1 -i "/tmp/cover.png" "$NOTIFY_TITLE"  "$MUSIC"
done
