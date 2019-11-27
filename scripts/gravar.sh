#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech

resolucao=$(xrandr | grep '*' | awk 'NR==1{print $1}')
if [ ! $1 ]; then
    local="$HOME/Vídeos/Screencast"
    nome="$(date "+%Y-%m-%d--%H-%M-%S").mp4"
    arquivo="$local/$nome"
fi
if pgrep -x "ffmpeg" > /dev/null
then
    [ "$(pgrep -x polybar)" ] && [ "$1" == "status" ] && exit
    if [ ! $1 ]; then
        killall ffmpeg
        notify-send "Gravação finalizada" "$nome"
        exit 0
    fi
else
    [ "$(pgrep -x polybar)" ] && [ "$1" == "status" ] && exit
    if [ ! "$1" ]; then
        notify-send "Gravação iniciada"
        ffmpeg -f x11grab -s $resolucao -i :0.0 -f pulse -ac 2 -i default -c:v libx264 -crf 23 -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -strict experimental -b:a 128k -movflags faststart $arquivo
    fi
fi
exit 0
