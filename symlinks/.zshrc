export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/dotfiles/zsh-custom"

ZSH_THEME="dca"
COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
KEYTIMEOUT=1

plugins=(git mercurial vi-mode svn-fast-info git-prompt wp-cli autoenv)

source ${ZSH}/oh-my-zsh.sh

if [ -n ${ZSH_VERSION-} ]; then
  autoload -U +X bashcompinit && bashcompinit

  have() {
    unset have
    (( ${+commands[$1]} )) && have=yes
  }

  if [ -d /etc/bash_completion.d/ ]; then
    source /etc/bash_completion.d/*
  fi
fi

if [ -r ~/dotfiles/.aliases ]; then
  source ~/dotfiles/.aliases
fi

if [ -r /etc/aliases.sh ]; then
  source /etc/aliases.sh
fi

unsetopt correct correct_all inc_append_history share_history
setopt append_history auto_cd complete_aliases hist_ignore_dups nohup notify pushd_ignore_dups

bindkey -v
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

umask 002

export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET="utf-8"

if [[ -f "./.env" ]]
then
    check_and_exec "./.env"
fi
