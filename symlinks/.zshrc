# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

fpath=($fpath ~/.local/share/zsh/site-functions)

COMPLETION_WAITING_DOTS="true"
DISABLE_CORRECTION="true"
KEYTIMEOUT=1
LOCALRC="$(printf "${HOME}/dotfiles/.rc.${HOSTNAME:=$HOST}")"
export PYTHONSTARTUP="${HOME}/dotfiles/helpers/pythonstartup.py"

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  zstyle ':completion:*' accept-exact '*(N)'
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -r ~/contrib/autoenv/autoenv.plugin.zsh ]]; then
  source ~/contrib/autoenv/autoenv.plugin.zsh
fi

if [[ -n ${ZSH_VERSION-} ]]; then
  autoload -U +X bashcompinit && bashcompinit

  if (( $+commands[wp]  )); then
    wpcli_completion="$(wp cli info | awk -F: '$1 ~/^WP-CLI root dir/ {gsub(/^[ \t]+/, "", $2); print $2}')/utils/wp-completion.bash"

    if [[ -r $wpcli_completion ]]; then
      source $wpcli_completion
    fi
  fi

  have() {
    unset have
    (( ${+commands[$1]} )) && have=yes
  }

  if [[ -d /etc/bash_completion.d/ ]]; then
    source /etc/bash_completion.d/*
  fi
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
setopt noflowcontrol
setopt nohup
setopt notify
setopt pushd_ignore_dups

bindkey -v

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

umask 002

# eval "$(starship init zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/dotfiles/helpers/.p10k.zsh ]] || source ~/dotfiles/helpers/.p10k.zsh

if [[ -r /etc/aliases.sh ]]; then
  source /etc/aliases.sh
fi

if [[ -r "${HOME}/dotfiles/.aliases" ]]; then
  source "${HOME}/dotfiles/.aliases"
fi

if [ -r "${LOCALRC}" ]; then
  source "${LOCALRC}"
fi

if [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]]; then
  source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi
