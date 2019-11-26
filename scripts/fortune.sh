#!/usr/bin/env bash
# Credit: Franklin Souza
# Telegram: @FranklinTech

scr='/tmp/screenshot.png'
icon="$HOME/.local/share/i3lock/archlinux.png"
font="$HOME/.fonts/Poppins.otf"

#[ ! -d $HOME/.local/share/fonts ] && mkdir -p $HOME/.local/share/fonts
#[ ! -f $font ] && curl -s -L 'https://www.dropbox.com/s/69ujvh8p7k8pah7/opensans.ttf?dl=1' > $font && fc-cache -v -f

[ ! -d $HOME/.local/share/i3lock/ ] && mkdir -p $HOME/.local/share/i3lock/
#[ ! -f $icon ] && curl -s -L 'https://ibb.co/9HjfPHK' > $icon

# Expand is used to convert the tabs to spaces which
# are handled better by imageMagick
fortune=$(expand -t 2 <(fortune -s brasil))
gradientColor='#282a36'

# take a screenshot
maim "$scr"

# get gradient dimensions directly from the screenshot
read width height <<<$(file $scr | cut -d, -f 2 | tr -d ' ' | tr 'x' ' ')
height=$((height / 2))

convert "$scr" -scale 10% -scale 1000%\
	-size "${width}x${height}" -gravity south-west \
	gradient:none-"$gradientColor" -composite -matte \
	"$icon" -gravity center -composite -matte \
	-gravity center -pointsize 20 \
	-font $font -fill "#EAE4D1" -annotate +0+200 "$fortune" "$scr"
i3lock -ui "$scr"
