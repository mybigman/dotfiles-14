#!/bin/sh

# Tela de bloqueio i3wm

# FONTE
font="$HOME/.fonts/Hack Nerd Font.ttf"

# TIRAR PRINT
scr='/tmp/screenshot.png'
#import -window root /tmp/screenshot.png

# BLUR
convert $HOME/Franks/Wallpapers/128.png -blur 0x5 /tmp/screenshotblur.png
#rm /tmp/screenshot.png


#TEXTO

convert "$scr" -scale 10% -scale 1000%\
	-size "${width}x${height}" -gravity south-west \
	gradient:none-"$gradientColor" -composite -matte \
	"$icon" -gravity center -composite -matte \
	-gravity center -pointsize 20 \
	-font $font -fill "#EAE4D1" -annotate +0+200 "$fortune Be you!" "$scr"
i3lock -ui "$scr"

# BLOQUEIO DE TELA
i3lock  -e -i /tmp/screenshotblur.png
exit 0
