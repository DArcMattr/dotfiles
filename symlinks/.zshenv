skip_global_compinit=1

export ANSIBLE_NOCOWS=1
export AUTOSSH_PORT=0
export MANWIDTH=80
export HGEDITOR=~/dotfiles/helpers/hgeditor
export TMP=/tmp

export PATH=/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/X11R6/bin:/usr/games
export PATH=${HOME}/.composer/vendor/bin:${HOME}/.local/bin:${HOME}/bin:${PATH}

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Browsers
#

if [[ "$OSTYPE" == darwin* ]]; then
  BROWSER='open'
else
  BROWSER='xdg-open'
fi
export BROWSER

#
# Editors
#

if type "nvim" > /dev/null; then
  EDITOR=`which nvim`
elif type "vim" > /dev/null; then
  EDITOR=`which vim`
else
  EDITOR=`which vi`
fi
export EDITOR
export VISUAL=${EDITOR}
#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi

if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
