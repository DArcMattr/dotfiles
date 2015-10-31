skip_global_compinit=1

export ANSIBLE_NOCOWS=1
export AUTOSSH_PORT=0
export MANWIDTH=80
export HGEDITOR=~/dotfiles/helpers/hgeditor
export TMP=/tmp

export PATH=/bin:/sbin:/usr/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin
export PATH=/usr/sbin:/usr/X11R6/bin:/usr/games:~/.composer/vendor/bin:$PATH

source ~/dotfiles/.aliases

if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
