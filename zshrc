# Crédits: Franklin Souza
# Telegram: @FranklinTech
##############################

# Exportar cores no TERM
export TERM='xterm-256color'

# Caminho da instalação do oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Temas para o zsh
#ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)

# Lado Direito
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Which plugins would you like to load?
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# My aliases
  alias x="startx"
  alias up="yay -Syyu"
  alias edt="howl ~/.zshrc"
  alias del="rm -rf ~/.zsh_history"
  alias off="poweroff"
  alias rb="reboot"
  alias music="mpd && ncmpcpp"
  alias km="killall mpd"
  alias fso="sudo firehol stop "
  alias fsa="sudo firehol start "
  alias vk="vkcube"
  alias ref="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist"
  alias kwm="pkill -9 compton ; pkill -9 i3"
  alias term="xrdb -merge ~/.Xresources"
  alias inf="free -h"
  alias arch="ufetch"
  alias br="setxkbmap -model abnt2 -layout br -variant abnt2"
  alias pkg="pacman -Qq | wc -l"
  alias rmy="rm -rf $HOME/.cache/yay"
  alias rpac="sudo rm -rf /var/cache/pacman/pkg/*"
  alias cm="cmatrix -C white"
  alias mine="wget https://raw.githubusercontent.com/fffranks/dotfiles/master/scripts/minecraft.sh"
  alias minecraft="$HOME/Scripts/./minecraft.sh"

  #Aliase scripts
  alias pipes="$HOME/Scripts/pipes.sh"
  alias pipes2="$HOME/Scripts/pipes.sh -t 2"
  alias crunch="$HOME/Scripts/Ascii/crunch.sh"
  alias guns="$HOME/Scripts/Ascii/guns.sh"
  alias pac="$HOME/Scripts/Ascii/pacman.sh"
  alias big="$HOME/Scripts/Ascii/big.sh"
  alias game="$HOME/Scripts/Ascii/game.sh"
  alias ghost="$HOME/Scripts/Ascii/ghost.sh"
  alias sysinfo="$HOME/Scripts/sysinfo-cli.sh"
  alias sysinfo1="$HOME/Scripts/sysinfo-natal.sh"
  alias sysinfo2="$HOME/Scripts/sysinfo.py"


# Plugins do zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Iniciar com o shell
# neofetch
# ufetch
