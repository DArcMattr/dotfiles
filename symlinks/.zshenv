[ -f /etc/environment ] && . /etc/environment

skip_global_compinit=1

export LC_COLLATE=C
export LOCAL="${HOME}/.local"
export PERL_MB_OPT="--install_base '${LOCAL}'";
export PERL_MM_OPT="INSTALL_BASE='${LOCAL}'";
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export ZDOTDIR="${ZDOTDIR:-$HOME}"
export PNPM_HOME="${LOCAL}/share/pnpm"

if (( $+commands[clang] && $+commands[clang++] )); then
  export CC=clang
  export CXX=clang++
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath gobin gopath mailpath manpath path perl5lib perl_local_lib_root

if which ruby >/dev/null && which gem >/dev/null; then
  gem_path="$(ruby -e 'puts Gem.user_dir')/bin"
fi

if [[ -x "${LOCAL}/bin/composer" || $(which composer >/dev/null 2>&1) ]]; then
  php_path="${XDG_CONFIG_HOME}/composer/vendor/bin"
fi

if [[ -x "${HOME}/go/bin" ]]; then
  gopath="${HOME}/go"
  gobin="${gopath}/bin"
  export GOPATH="${gopath}"
  export GOBIN="${gobin}"
fi

if [[ -x "${HOME}/.cargo/bin" || $(which rustc >/dev/null 2>&1) ]]; then
  cargo_path="${HOME}/.cargo/bin"
fi

if [[ -x "${HOME}/.cabal/bin" ]]; then
  haskell_path="${HOME}/.cabal/bin"
fi

# Set the the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  $gobin
  $cargo_path
  $php_path
  $gem_path
  $haskell_path
  ${PNPM_HOME}
  ${LOCAL}/bin
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

if [[ -d ${HOME}/.sdkman ]]; then
  export SDKMAN_DIR="${HOME}/.sdkman"
fi
