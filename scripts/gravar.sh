#!/bin/bash

notify-send "FFmpeg" "Gravação inicada"

ffmpeg -video_size 1600x900 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default /home/$USER/Vídeos/Tela_$(date +%d-%m-%Y_%H:%M:%S).mp4
