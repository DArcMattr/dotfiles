export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/dotfiles/zsh-custom"
export AUTOENV_IN_FILE=".in"

ZSH_THEME="dca"
COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
KEYTIMEOUT=1

plugins=(vi-mode svn-fast-info git-prompt autoenv nvm ssh-agent)

source ${ZSH}/oh-my-zsh.sh

if [ -n ${ZSH_VERSION-} ]; then
  autoload -U +X bashcompinit && bashcompinit

  have() {
    unset have
    (( ${+commands[$1]} )) && have=yes
  }

  if [[ -f "./.in" ]]; then
    check_and_exec "./.in"
  fi

  if [ -d /etc/bash_completion.d/ ]; then
    source /etc/bash_completion.d/*
  fi

  autoload -U add-zsh-hook

  load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    fi
  }
  add-zsh-hook chpwd load-nvmrc
fi

if [ -r ~/dotfiles/.aliases ]; then
  source ~/dotfiles/.aliases
fi

if [ -r /etc/aliases.sh ]; then
  source /etc/aliases.sh
fi

unsetopt correct
unsetopt correct_all
unsetopt inc_append_history
unsetopt share_history

setopt append_history
setopt auto_cd
setopt auto_resume
setopt complete_aliases
setopt hist_ignore_dups
setopt nohup
setopt notify
setopt pushd_ignore_dups

bindkey -v
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

umask 002

export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET="utf-8"
