#!/usr/bin/env zsh

# chicken & egg time here, relies on system version of go to bootstrap
grab_go() {
  pkgs=(
    'filippo.io/mkcert'
    'github.com/antonmedv/fx'
    'github.com/cosmtrek/air'
    'github.com/junegunn/fzf'
    'github.com/tdewolff/minify/cmd/minify'
    'golang.org/x/tools/cmd/guru'
    'golang.org/x/tools/gopls'
  )
  version='1.20.4'

  while getopts "v:" opt; do
    case "$opt" in
      v) VERSION=${OPTARG:-${version}}
        ;;

      :) echo "Option -${opt} requires an argument." >&2
        return 1
        ;;

      *) echo "Invalid Option: -${opt}" >&2
        return 1
        ;;
    esac
  done

  # bootstrap
  if (( ${+VERSION} )); then
    go install "golang.org/dl/go${VERSION}@latest"
    "${go_bin}/go${VERSION}" download

    ln -sf "${HOME}/go/bin/go${VERSION}" "${HOME}/.local/bin/go"
  fi

  for i in $pkgs; do
    go install "${i}@latest"
  done
}

grab_rust() {
  if [ ! -x "${HOME}/.cargo/bin" ] && [ ! "$(which rustc >/dev/null)" ]; then
    curl https://sh.rustup.rs -sSf | sh
    "${HOME}/.cargo/env"
    rehash
  else
    rustup self update
    rustup update
  fi

  "${HOME}/.cargo/bin/rustup" completions zsh >! "${HOME}/.local/share/zsh/site-functions/_rustup"

  cd "${HOME}" && "${HOME}/.cargo/bin/cargo" install --force \
    bat \
    cargo-deb \
    cargo-update \
    exa \
    ripgrep \
    difftastic
}

grab_pips() {
  config_home="${XDG_CONFIG_HOME:=$HOME/.config}"
  pip3pkgs=(
    'docutils'
    'doge'
    'flake8'
    'gsutil'
    'hg-git'
    'httpie'
    'icdiff'
    'mercurial'
    'msgpack'
    'mycli'
    'neovim-remote'
    'pip'
    'powerline-status'
    'psutil'
    'pyemojify'
    'pynvim'
    'python-lsp-server[yapf]'
    's3cmd'
    'sphinx'
  )

  pip install -U --user --break-system-packages ${pip3pkgs}

  ## redundant to force an update of specific packages, then to update all the
  ## installed ones
  #pip3 freeze --user | grep -v '^\-e' | cut -d = -f 1 | \
  #  xargs -n1 pip3 install -U --user

  if [ ! -d "${config_home}/powerline" ]; then
    mkdir -p "${config_home}/powerline"
  fi

  powerline_path="$(dirname "$(python3 -c 'import powerline; print (powerline.__file__)')")"

  rsync -a "${powerline_path}/config_files/" "${config_home}/powerline"

  if [ ! -f "${config_home}/powerline/powerline.conf" ]; then
    ln -s \
      "${powerline_path}/bindings/tmux/powerline.conf" \
      "${config_home}/powerline/powerline.conf"
  fi
}

grab_npms() {
  (
    cd "${HOME}/dotfiles"
    ncu -u
    npm install
  )
}

grab_composer() {
  (
    cd /tmp
    if ! command -v composer >/dev/null 2>&1 ; then
      (
        config_home="${XDG_CONFIG_HOME:=$HOME/.config}"
        mkdir -p "${HOME}/.local/bin"
        if [ ! -d "${config_home}/composer" ]; then
          ln -s "${HOME}/dotfiles/xdg/composer" "${config_home}/composer"
        fi
        cd "${TMP}" || exit
        EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

        if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ] ; then
          >&2 echo 'ERROR: Invalid installer signature'
          rm composer-setup.php
          exit 1
        fi

        php composer-setup.php --quiet --install-dir="${HOME}/.local/bin"

        curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"; \
          mv composer.phar "${HOME}/.local/bin/composer"
        cd "${HOME}" || exit
        composer global install
      )
    else
      composer global upgrade
    fi
  )
}

grab_gems() {
  if which ruby >/dev/null && which gem >/dev/null; then
    gem install --user-install lolcat neovim mailcatcher solargraph
  fi
}

grab_git() {
  while getopts ":r:d:b:n" opt; do
    case "${opt}" in
      d) INSTALL_PATH="${OPTARG}"
        ;;

      r) REPO="${OPTARG}"
        ;;

      b) BRANCH="${OPTARG}"
        ;;

      n) NO_COMPILE=1
        ;;

      *) echo "Invalid Option: -${OPTARG}" >&2
        exit 1
        ;;

      :) echo "Option -${OPTARG} requires arguments." >&2
        exit 1
        ;;
    esac
  done

  (
    if [ ! -d "${INSTALL_PATH}/.git" ]; then
      git clone "${REPO}" \
        "${INSTALL_PATH}" &&
        cd "${INSTALL_PATH}" &&
        git checkout "${BRANCH:-$(git describe --abbrev=0 --tags)}"
    else
      cd "${INSTALL_PATH}" &&
      git remote update -p origin  &&
      git checkout master &&
      git merge --ff-only &&
      git checkout "${BRANCH:-$(git describe --abbrev=0 --tags)}"
    fi

    if [ -z ${NO_COMPILE} ]; then
      cd "${INSTALL_PATH}" && \
      ./autogen.sh && \
      ./configure --prefix="${HOME}/.local" && \
      make install clean
    fi
  )
}
