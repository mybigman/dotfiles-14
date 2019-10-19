# Crédits: Franklin Souza
# Telegram: @FranklinTech
##############################

# Exportar cores no TERM
export TERM='xterm-256color'

# Caminho da instalação do oh-my-zsh.
export ZSH="$HOME/.oh-my-zsh"

# Temas para o zsh
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

# Cores do Powerline
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='dodgerblue1'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='lightyellow'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='black'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='red'
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
POWERLEVEL9K_OS_ICON_FOREGROUND='dodgerblue1'
POWERLEVEL9K_OS_ICON_BACKGROUND='black'
POWERLEVEL9K_DATE_FOREGROUND='green1'
POWERLEVEL9K_DATE_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='white'

# HORA OU DATA
POWERLEVEL9K_TIME_FORMAT="%T"

# Lado Esquerdo
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)

# Lado Direito
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# Which plugins would you like to load?
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# My aliases
  
  alias x="startx"
  alias up="sudo pacman -Syu"
  alias upg="sudo pacman -Syy"
  alias edt="vim ~/.zshrc"
  alias del="rm -rf ~/.zsh_history"
  alias off="poweroff"
  alias rb="reboot"
  alias music="mpd && ncmpcpp"
  alias km="killall mpd"
  alias pipes="$HOME/Scripts/pipes.sh"
  alias pipes2="$HOME/Scripts/pipes.sh -t 2"
  alias fso="sudo firehol stop "
  alias fsa="sudo firehol start "
  alias vk="vkcube"
  alias ref="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist"
  alias kwm=" pkill -9 compton ; pkill -9 i3"
  alias term="xrdb -merge ~/.Xresources"


# Plugins do zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Iniciar com o shell
# neofetch
