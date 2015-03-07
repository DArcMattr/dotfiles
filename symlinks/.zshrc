if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CLICOLOR=YES
export CLICOLOR_FORCE=YES

#ZSH_THEME="dca"

autoload -U +X bashcompinit && bashcompinit

have() {
  unset -v have
  PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null && have="yes"
}

if [ -d /etc/bash_completion.d/ ]; then
  source /etc/bash_completion.d/*
fi

source ~/contrib/wp-cli/utils/wp-completion.bash

source ~/dotfiles/.aliases

if [ -r /etc/aliases.sh ]; then
  source /etc/aliases.sh
fi

#unsetopt correct
#unsetopt correct_all
unsetopt inc_append_history
unsetopt share_history

setopt append_history
setopt auto_cd
setopt complete_aliases
setopt hist_ignore_dups
setopt nohup
setopt notify
setopt pushd_ignore_dups

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

set -o vi

umask 002

export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET=utf-8

if [ -r ~/dotfiles/.profile.${HOSTNAME:=$HOST} ]; then
  source ~/dotfiles/.profile.${HOSTNAME:=$HOST}
fi