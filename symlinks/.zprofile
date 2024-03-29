# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

LOCALPROFILE="${HOME}/dotfiles/.profile.${HOST}"

export PAGER='less'
export MANPAGER='nvim +Man!'
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export XDG_CONFIG_HOME="${HOME}/.config"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export LC_COLLATE=C

if [[ -x clang ]]; then
  export CC=clang
  export CXX=clang++
fi

# Less

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# export LESS='-F -g -i -M -R -S -w -X -z-4'

export LESS="-EFIMQRsX~ -x2"

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if [ -r "${LOCALPROFILE}" ]; then
  source "${LOCALPROFILE}"
fi

# Generated by running `xdg-user-dirs` and `xdg-user-dirs-update`
if [ -r "${XDG_CONFIG_HOME}/user-dirs.dirs" ]; then
  source "${XDG_CONFIG_HOME}/user-dirs.dirs"
  export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}/${USER}/runtime-${USER}/"
fi
