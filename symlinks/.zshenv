skip_global_compinit=1

export ANSIBLE_NOCOWS=1
export AUTOSSH_PORT=0
export MANWIDTH=80
export HGEDITOR=~/dotfiles/helpers/hgeditor
export TMP=/tmp
export AUTOENV_IN_FILE=".in"
export ZSH_CUSTOM="${HOME}/dotfiles/zsh-custom"

#
# Paths
#
typeset -T PYTHONPATH pythonpath

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path pythonpath php_path gem_path manpath

if which ruby >/dev/null && which gem >/dev/null; then
  gem_path="$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
else
  gem_path=""
fi

if which python >/dev/null && [ "$(python -c 'import platform; print(platform.python_version_tuple()[0]);')" -eq 2 ]; then
  python2_path=$(python -c $'import sys\nfor x in sys.path:\n  print(x)')
fi

if which python3 >/dev/null; then
  python3_path=$(python3 -c $'import sys\nfor x in sys.path:\n  print(x)')
fi

if which composer >/dev/null; then
  php_path="$(composer global config bin-dir --absolute 2>/dev/null)"
else
  php_path=""
fi

pythonpath=(
  $python2_path
  $python3_path
)

# Set the the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  ~/.local/bin
  $php_path
  $gem_path
  ~/bin
  /usr/local/{,s}bin
  /usr/{,s}bin
  /{,s}bin
  /usr/X11R6/{,s}bin
  /usr/games
)

manpath=(
  ~/.local/share/man
  $manpath
)

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Browsers
if [[ "$OSTYPE" == darwin* ]]; then
  BROWSER='open'
else
  BROWSER='xdg-open'
fi
export BROWSER

# Editors
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
  export TMPDIR="/tmp/${LOGNAME}"
  mkdir -p -m 700 "${TMPDIR}"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "${TMPPREFIX}" ]]; then
  mkdir -p "${TMPPREFIX}"
fi

if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
