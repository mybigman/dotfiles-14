#!/bin/bash
# Criador: FelipeFacundes
# Telegram: @fefacundes
#
#
# Franklin Souza Telegram: @FranklinTech
#
#
# SCRIPT PARA INSTALAR Minecraft
#
#
# Criando pastas
cd ~
mkdir -p ~/.local/share/applications/
mkdir -p ~/.jogos/linux/minecraft/
mkdir -p ~/.jogos/icons/
mkdir -p ~/.jogos/scripts/run/
mkdir -p ~/.jogos/setups/

cd ~/.jogos/scripts/run/
wget -nc https://raw.githubusercontent.com/fffranks/dotfiles/master/scripts/minecraft-run.sh
chmod +x minecraft-run.sh
cd ~/.jogos/icons/
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/icons/minecraft.png

# Criando o atalho .desktop
cd ~/.local/share/applications/
echo "#!/usr/bin/env xdg-open" > minecraft.desktop
echo "[Desktop Entry]" >> minecraft.desktop
echo "Name=Minecraft" >> minecraft.desktop
echo "Comment=O Famoso jogo de construção" >> minecraft.desktop
echo "Categories=Game;" >> minecraft.desktop
echo "Exec=/home/$USER/.jogos/scripts/run/minecraft-run.sh" >> minecraft.desktop
echo "Type=Application" >> minecraft.desktop
echo "StartupNotify=true" >> minecraft.desktop
echo "Icon=/home/$USER/.jogos/icons/minecraft.png" >> minecraft.desktop
echo "Terminal=false" >> minecraft.desktop

# Desinstalar
cd ~/.jogos/scripts/run/
touch remover-minecraft.sh
echo "rm -rf /home/$USER/.local/share/applications/minecraft.desktop" > remover-minecraft.sh
echo "rm -rf /home/$USER/.jogos/wineprefixes/minecraft/" >> remover-minecraft.sh
echo "rm -rf /home/$USER/.jogos/scripts/run/minecraft-run.sh" >> remover-minecraft.sh
echo "rm -rf /home/$USER/.local/share/applications/remover-minecraft.desktop" >> remover-minecraft.sh
echo "rm -rf /home/$USER/.jogos/scripts/run/remover-minecraft.sh" >> remover-minecraft.sh
chmod +x remover-minecraft.sh
cd ~/.local/share/applications/
touch remover-minecraft.desktop
echo "#!/usr/bin/env xdg-open" > remover-minecraft.desktop
echo "[Desktop Entry]" >> remover-minecraft.desktop
echo "Name=Remover Minecraft" >> remover-minecraft.desktop
echo "Comment=Remover minecraft" >> remover-minecraft.desktop
echo "Categories=Game;" >> remover-minecraft.desktop
echo "Exec=/home/$USER/.jogos/scripts/run/remover-minecraft.sh" >> remover-minecraft.desktop
echo "Type=Application" >> remover-minecraft.desktop
echo "StartupNotify=true" >> remover-minecraft.desktop
echo "Icon=/home/$USER/.jogos/icons/remover.png" >> remover-minecraft.desktop
echo "Terminal=false" >> remover-minecraft.desktop
cd ~/.jogos/icons/
wget -nc https://raw.githubusercontent.com/felipefacundes/PS/master/icons/remover.png > /dev/null 2>&1

export TERM=xterm
export ESYNC=0
export vblank_mode=0
# Para placas gráficas híbridas use o DRI_PRIME=1
#export DRI_PRIME=1

# Executar o instalador e depois o jogo
cd ~/.jogos/linux/minecraft
wget -nc "https://tlaun.ch/download.php?&package=mcl/jar" -O TLauncher-MCL.jar
#notify-send "Para rodar esse jogo você precisará do jre8-openjdk (OpenJDK 1.8) e java-openjfx"
####################################################################################################
cd "/home/$USER/.jogos/linux/minecraft/"
java -jar TLauncher-MCL.jar

# Irá abrir a localização e o script de inicialização do jogo:
#xdg-open ~/.jogos/wineprefixes/minecraft/drive_c/
#xdg-open ~/.jogos/scripts/run/minecraft-run.sh

################################# Finalização
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
notify-send "INSTALAÇÃO FINALIZADA COM SUCESSO"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
pkill -9 .exe
sleep 4
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
notify-send "PODE FECHAR O TERMINAL"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"


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
