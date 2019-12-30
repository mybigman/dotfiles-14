# Path to your oh-my-zsh installation.
export ZSH="/data/data/com.termux/files/home/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_DISABLE_RPROMPT=true
##POWERLEVEL9K_PROMPT_ON_NEWLINE=true


#POWERLEVEL9K_TIME_FORMAT="%T"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

