[ -f /etc/environment ] && . /etc/environment

skip_global_compinit=1

export LOCAL="${HOME}/.local"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath manpath path perl5lib perl_local_lib_root

if which ruby >/dev/null && which gem >/dev/null; then
  gem_path="$(ruby -e 'puts Gem.user_dir')/bin"
fi

if [[ -x "${LOCAL}/bin/composer" || $(which composer >/dev/null 2>&1) ]]; then
  php_path="${XDG_CONFIG_HOME}/composer/vendor/bin"
fi

if [[ -x "${HOME}/go/bin" ]]; then
  export GOPATH=${HOME}/go
  go_bin="${GOPATH}/bin"
fi

if [[ -x "${HOME}/.cargo/bin" || $(which rustc >/dev/null 2>&1) ]]; then
  cargo_path="${HOME}/.cargo/bin"
fi

if [[ -x "${HOME}/.cabal/bin" ]]; then
  haskell_path="${HOME}/.cabal/bin"
fi

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

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/${LOGNAME}"
  mkdir -p -m 700 "${TMPDIR}"
fi

export ANSIBLE_NOCOWS=1
export AUTOENV_IN_FILE=".in"
export AUTOSSH_PORT=0
export MANWIDTH="$(( 96 > $(tput cols) ? $(tput cols) : 96 ))"

export HGEDITOR="${HOME}/dotfiles/helpers/hgeditor"
export PERL_MB_OPT="--install_base '${LOCAL}'";
export PERL_MM_OPT="INSTALL_BASE='${LOCAL}'";

# Set the the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  $go_bin
  $cargo_path
  $cargo_path
  $php_path
  $gem_path
  $haskell_path
  ${LOCAL}/bin
  ${LOCAL}/lib/node_modules/.bin
  /usr/local/{,s}bin
  /usr/{,s}bin
  /{,s}bin
  $path
)

perl5lib=(
  ${LOCAL}/lib/perl5
  ${PERL5LIB}
)

perl_local_lib_root=(
  ${LOCAL}
  ${PERL_LOCAL_LIB_ROOT}
)

# Editors
if type "nvim" > /dev/null; then
  EDITOR=$(which nvim)
elif type "vim" > /dev/null; then
  EDITOR=$(which vim)
else
  EDITOR=$(which vi)
fi
export EDITOR
export VISUAL=${EDITOR}

if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

if [[ -d ${HOME}/.sdkman ]]; then
  export SDKMAN_DIR="${HOME}/.sdkman"
fi
