#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export PAGER='less'
export TERM=xterm-256color
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CLICOLOR=YES
export CLICOLOR_FORCE=YES

#
# Browser
#

if [ -x ~/.vim/plugged/vimpager/vimpager ]; then
  export MANPAGER=~/.vim/plugged/vimpager/vimpager
  alias vimcat='~/.vim/plugged/vimpager/vimcat'
  alias vimpager='~/.vim/plugged/vimpager/vimpager'
fi

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
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  ~/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

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

if [ -r ~/dotfiles/.profile.${HOSTNAME:=$HOST} ]; then
  source ~/dotfiles/.profile.${HOSTNAME:=$HOST}
fi
