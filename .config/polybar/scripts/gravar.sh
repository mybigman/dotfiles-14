#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
#
# Gravar tela com FFmpeg

resolucao=$(xrandr | grep '*' | awk 'NR==1{print $1}')
if [ ! $1 ]; then
    local="$HOME/Vídeos/Screencast"
    nome="$(date "+%Y-%m-%d--%H-%M-%S")"
    arquivo="${local}screencast-${nome}.mp4"
fi

if pgrep -x "ffmpeg" > /dev/null
then
    [ "$(pgrep -x polybar)" ] && [ "$1" == "status" ] && echo "%{F#f82c2c}%{F-}" && exit
    if [ ! $1 ]; then
        killall ffmpeg
        notify-send "FFmpeg" "Gravação de tela finalizada!"
        exit 0
    fi
else
    [ "$(pgrep -x polybar)" ] && [ "$1" == "status" ] && echo "" && exit
    if [ ! "$1" ]; then
        notify-send "FFmpeg" "Gravação de tela iniciada!"
        ffmpeg -f x11grab -s $resolucao -i :0.0 -f pulse -ac 2 -i default -c:v libx264 -crf 23 -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -strict experimental -b:a 128k -movflags faststart $arquivo
    fi
fi
exit 0
