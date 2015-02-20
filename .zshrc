export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/dotfiles/zsh-custom
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CLICOLOR=YES
export CLICOLOR_FORCE=YES

ZSH_THEME="dca"

COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
KEYTIMEOUT=1

plugins=(git mercurial vi-mode svn-fast-info git-prompt)

source $ZSH/oh-my-zsh.sh

autoload bashcompinit

bashcompinit

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

unsetopt correct
unsetopt correct_all
unsetopt inc_append_history
unsetopt share_history

setopt append_history
setopt auto_cd
setopt complete_aliases
setopt hist_ignore_dups
setopt nohup
setopt notify
setopt pushd_ignore_dups

set -o vi

umask 002

export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET=utf-8

if [ -r ~/dotfiles/.profile.${HOSTNAME:=$HOST} ]; then
  source ~/dotfiles/.profile.${HOSTNAME:=$HOST}
fi
