# Path to your oh-my-zsh configuration.

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/dotfiles/zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dca"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
KEYTIMEOUT=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial vi-mode pip svn-fast-info)

source $ZSH/oh-my-zsh.sh
source ~/.profile

autoload bashcompinit
bashcompinit
#have() {
#  unset -v have
#  PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin type $1 &>/dev/null && have="yes"
#}
#
#if [ -d /etc/bash_completion.d/ ]; then
#  source /etc/bash_completion.d/*
#fi
#if [ -d /usr/local/etc/bash_completion.d/ ]; then
#  source /usr/local/etc/bash_completion.d/*
#fi
source ~/contrib/wp-completion/wp-completion.bash

source ~/dotfiles/.aliases
if [ -r /etc/aliases.sh ]; then
  source /etc/aliases.sh
fi
if [ -r ~/dotfiles/.aliases.${HOSTNAME} ]; then
  source ~/dotfiles/.aliases.${HOSTNAME}
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
