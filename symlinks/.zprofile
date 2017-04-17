#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export PAGER='less'
export MANPAGER="nvim -c 'set ft=man' -"
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export XDG_CONFIG_HOME="${HOME}/.config"

if which ruby >/dev/null && which gem >/dev/null; then
  gem_path="$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
else
  gem_path=""
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  ~/.local/bin
  $gem_path
  ~/bin
  /usr/local/{bin,sbin}
  $path
)

manpath=(
  ~/.local/share/man
  $manpath
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

if [ -r ~/dotfiles/.profile.${HOSTNAME:=$HOST} ]; then
  source ~/dotfiles/.profile.${HOSTNAME:=$HOST}
fi
