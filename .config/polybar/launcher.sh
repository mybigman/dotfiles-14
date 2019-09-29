#Crédits: Franklin Souza
#Telegram: @FranklinTech
#!/usr/bin/env sh
# Jogar na pasta: $HOME/.config/polybar


# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q top &
polybar -q bottom &
