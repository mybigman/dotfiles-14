#!/bin/bash

export TERM=xterm
export ESYNC=0
export vblank_mode=0
# Para placas gráficas híbridas use o DRI_PRIME=1
#export DRI_PRIME=1

# Executar o instalador e depois o jogo

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Para rodar esse jogo você precisará do jre8-openjdk (OpenJDK 1.8) e java-openjfx"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

cd "/home/$USER/.jogos/nativos/minecraft/"
java -jar TLauncher-MCL.jar

#
# ┏┓
# ┃┃╱╲ nesta
# ┃╱╱╲╲ casa
# ╱╱╭╮╲╲ todos
# ▔▏┗┛▕▔ usam
# ╱▔▔▔▔▔▔▔▔▔▔╲
# LINUX
# ╱╱┏┳┓╭╮┏┳┓ ╲╲
# ▔▏┗┻┛┃┃┗┻┛▕▔
# -------------------------
