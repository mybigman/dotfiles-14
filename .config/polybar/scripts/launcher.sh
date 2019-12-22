#!/usr/bin/env sh
# Credit: Franklin Souza
# Telegra: @FranklinTech

# Se quiser só a bar de baixo, comenta a (polybar -q top &) se quiser só a bar de cima comenta a (polybar -q bottom &)
# E se quiser as duas, deixa ambas descomentas

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q top &
polybar -q bottom &
