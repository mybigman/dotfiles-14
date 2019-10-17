#!/bin/bash

# Credits: Franklin Souza
# Telegra: @FranklinTech

ArtDir=$HOME/Música
COVER=/tmp/cover.png

(
  album=$(mpc current -f %album%)

  ART=$(find ${ArtDir} -regex ".*/\(${album}\)\.\(png\|jpe?g\)")
  convert -resize 30x70 ${ART} ${COVER} /tmp/cover.png
  printf "\e]20;${COVER};30x70+4+35\a"
) &
