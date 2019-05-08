# .bashrc
if [[ -t 1 && -x /usr/bin/zsh && $- == *i* ]]; then
  exec /usr/bin/zsh -l
fi

# Source global definitions
if [[ -f /etc/bashrc ]]; then
	. /etc/bashrc
fi

if [[ $- = *i* ]] || [[ ! -z "$VIM" ]]; then
  if [[ -f ~/dotfiles/.aliases ]]; then
    . ~/dotfiles/.aliases
  fi
fi

# Settings
ulimit -c 0
set -o vi
umask 002

declare -x CVS_RSH='ssh'
declare -x CLICOLOR=YES
declare -x CLICOLOR_FORCE=YES
declare -x LS_COLORS='no=01;37:fi=01;37:di=01;34:ln=01;36:pi=01;32:so=01;35:do=01;35:bd=01;33:cd=01;33:ex=01;31:mi=00;05;37:or=00;05;37:'
declare -x LSCOLORS='ExFxCxDxBxEgEdAbAgAcAd'
declare -x PAGER='less'
declare -x EDITOR='vim'
declare -x VISUAL="${EDITOR}"
declare -x LESS="-EFIMQRsX~ -x2"
declare -x MANWIDTH=72

declare -x HGEDITOR=~/dotfiles/helpers/hgeditor

##############################
# ##### PROMPT SECTION ##### #
##############################

#unset PROMPT_COMMAND

# color_name='\[\033[ color_code m\]'

rgb_restore='\[\033[00m\]'
rgb_red='\[\033[01;31m\]'
rgb_yellow='\[\033[01;33m\]'
rgb_white='\[\033[01;37m\]'

rgb_std="${rgb_white}"

if [ "$(id -u)" -eq 0 ]; then
  rgb_usr="${rgb_red}"
else
  rgb_usr="${rgb_yellow}"
fi

[ -n "$PS1" ] && PS1="\n${rgb_usr}[\t]${rgb_std}\n\$(pwd)${rgb_usr}\n\$${rgb_restore} "

unset rgb_restore \
  rgb_red         \
  rgb_yellow      \
  rgb_white       \
  rgb_usr

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/david/.sdkman"
[[ -s "/home/david/.sdkman/bin/sdkman-init.sh" ]] && source "/home/david/.sdkman/bin/sdkman-init.sh"
