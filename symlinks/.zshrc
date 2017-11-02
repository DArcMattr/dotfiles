fpath=(~/dotfiles/zsh-custom ~/.local/share/zsh/site-functions $fpath)

COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
KEYTIMEOUT=1

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -r ~/contrib/autoenv/autoenv.plugin.zsh ]]; then
  source ~/contrib/autoenv/autoenv.plugin.zsh
fi

if [[ -n ${ZSH_VERSION-} ]]; then
  autoload -U +X bashcompinit && bashcompinit

  have() {
    unset have
    (( ${+commands[$1]} )) && have=yes
  }

  if [[ -d /etc/bash_completion.d/ ]]; then
    source /etc/bash_completion.d/*
  fi

  if [[ -r ~/contrib/wp-completion.bash ]]; then
    source ~/contrib/wp-completion.bash
  fi
fi

if [[ -r /etc/aliases.sh ]]; then
  source /etc/aliases.sh
fi

if [[ -r ~/dotfiles/.aliases ]]; then
  source ~/dotfiles/.aliases
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
