#   ________      _______. __    __  .______        ______
#  |       /     /       ||  |  |  | |   _  \      /      |
#  `---/  /     |   (----`|  |__|  | |  |_)  |    |  ,----'
#     /  /       \   \    |   __   | |      /     |  |
# __ /  /----.----)   |   |  |  |  | |  |\  \----.|  `----.
#(__)________|_______/    |__|  |__| | _| `._____| \______|

# Crédits: Franklin Souza
# Telegram: @FranklinTech
##############################

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Exportar cores no TERM
export TERM='xterm-256color'

# Caminho da instalação do oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Temas para o zsh
#ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"
#POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL10K_MODE="nerdfont-complete"

#POWERLEVEL9K_DISABLE_PROMPT=true

# Cores do Powerline9k
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON='⚙'
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='dodgerblue1'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='lightyellow'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='red1'
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='white'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_DIR_ETC_BACKGROUND='white'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='lightred'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_OS_ICON_FOREGROUND='white'
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_DATE_FOREGROUND='white'
POWERLEVEL9K_DATE_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='white'

# Uso do POWELINE9K
#disk_usage = Disco usado
#status = Status do comando digitado
#time = Hora do sistema
#date = Data do sistema
#ram = Mostra a RAM do sistema

# HORA OU DATA
POWERLEVEL9K_TIME_FORMAT=%T

# Lado Esquerdo
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)

# Lado Direito
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Which plugins would you like to load?
plugins=(autoupdate)

source $ZSH/oh-my-zsh.sh
#source ~/powerlevel10k/powerlevel10k.zsh-theme


#My aliases
  alias x="startx"
  alias up="sudo pacman -Syu"
  alias edt="howl ~/.zshrc"
  alias edtt="vim ~/.p10k.zsh"
  alias del="rm -rf ~/.zsh_history"
  alias off="sleep 4 && poweroff"
  alias rb="sleep 4 && reboot"
  alias music="mpd && ncmpcpp"
  alias km="killall mpd"
  alias fso="sudo firehol stop "
  alias fsa="sudo firehol start "
  alias vk="VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay vkcube"
# alias ref="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist"
  alias kwm="pkill -9 picom ; pkill -9 i3"
# alias term="xrdb -merge ~/.Xresources"
  alias inf="free -h"
  alias arch="ufetch"
  alias br="setxkbmap br &"
  alias rct="sudo pacman -Scc"
  alias rc="sudo pacman -Sc"
  alias cm="cmatrix -C white"
  alias icon1="sudo pacman -S papirus-icon-theme"
  alias inff="inxi -Fxxxz"
  alias pull="git pull"
  alias infoo="sudo cpu-x"
  alias nup="sudo ip link set enp3s0 up"
  alias ndow="sudo ip link set enp3s0 down"
  alias clock="tty-clock -c -C 3"
  alias help="cat ~/.zshrc | grep alias"
  alias pin="ping 192.168.0.1"
# alias pmirror="sudo chmod 0644 /etc/pacman.d/mirrorlist"
  alias cache="cd /var/cache/pacman/pkg"
  alias clima="curl wttr.in"
  alias mine="java -jar $HOME/Franks/Jogos/Minecraft/Minecraft.jar"
  alias neo="neofetch --ascii ~/Ascii/rose.txt"
  alias torr="torrenter"
# alias kp="killall picom"
# alias sp="picom -c &"
  alias 1="exec wal -i ~/Franks/Wallpapers/030.png &"
  alias 2="exec wal -i ~/Franks/Wallpapers/002.jpg &"
  alias 3="exec wal -i ~/Franks/Wallpapers/029.png &"



#Aliase scripts
  alias pipes="$HOME/Scripts/pipes.sh"
  alias pipes2="$HOME/Scripts/pipes.sh -t 2"
  alias pipes3="$HOME/Scripts/pipes.sh -t 3"
  alias crunch="$HOME/Scripts/Ascii/crunch.sh"
  alias crunchm="$HOME/Scripts/Ascii/crunchbang-mini.sh"
  alias guns="$HOME/Scripts/Ascii/guns.sh"
  alias pac="$HOME/Scripts/Ascii/pacman.sh"
  alias game="$HOME/Scripts/Ascii/game.sh"
  alias ghost="$HOME/Scripts/Ascii/ghost.sh"
  alias fetch="$HOME/Scripts/sysinfo.py"
  alias fetch1="$HOME/Scripts/sysinfo-cli.sh"
  alias gravar="$HOME/Scripts/gravar.sh"
  alias instagram="$HOME/Scripts/insta.sh"
  alias add="$HOME/Scripts/adduser.sh"
  alias dell="$HOME/Scripts/userdel.sh"
  alias down="$HOME/Scripts/videodown.sh"
  alias pcolor="$HOME/Scripts/Ascii/colorview.sh"
  alias colorpanes="$HOME/Scripts/Ascii/panes.sh"
  alias speedt="$HOME/Scripts/speedtest-cli.sh"
  alias mirror="sudo $HOME/Scripts/mirrorlist.sh"
  alias tel="$HOME/Scripts/telegram_installer.sh"
  alias em="howl Scripts/mirrorlist.sh"
  alias elf="$HOME/Scripts/Ascii/elfman.sh"
  alias casar="echo Franklin, eu Linux aceito seu pedido de casamento"
  alias gravar="sh $HOME/Scripts/gravar.sh"
# alias rp="$HOME/.config/polybar/scripts/launch.sh"
  alias delwal="wal -c"


# Plugins do zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Iniciar com o shell
# neofetch
# ufetch

#########################################################################################
# POWERLEVEL10K
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
