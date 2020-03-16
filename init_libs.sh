#!/usr/bin/env zsh

# chicken & egg time here
grab_go() {
  version='1.14'
  pkgs=(
    'github.com/FiloSottile/mkcert' 
    'github.com/canthefason/go-watcher' 
    'github.com/junegunn/fzf' 
    'github.com/sourcegraph/go-langserver'
  )

  go get -u golang.org/dl/go${version}
  ${go_bin}/go${version} download

  for i in $pkgs; do
    ${go_bin}/go${version} get -u "${i}"
    ${go_bin}/go${version} install "${i}"
  done

  ln -sf "${HOME}/go/bin/go${version}" "${HOME}/.local/bin/go"
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

  mkdir -p "${HOME}/.zfunc" && \
    rm -f "${HOME}/.zfunc/_rustup"; \
    "${HOME}/.cargo/bin/rustup" completions zsh > "${HOME}/.zfunc/_rustup"

  cd "${HOME}" && "${HOME}/.cargo/bin/cargo" install --force cargo-deb cargo-update exa
}

grab_pips() {
  config_home="${XDG_CONFIG_HOME:=$HOME/.config}"
  pip2pkgs=(
    'pip' 
    'pynvim'
  )
  pip3pkgs=(
    'doge'
    'flake8'
    'gsutil'
    'httpie'
    'icdiff'
    'mercurial'
    'msgpack'
    'mycli'
    'pip'
    'powerline-status'
    'psutil'
    'pyemojify'
    'pynvim' 
    'python-language-server[all]' 
    's3cmd'
    'sphinx'
  )

  pip2 install -U --user $pip2pkgs
  pip3 install -U --user $pip3pkgs

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

grab_yarns() {
  # import packages.json into source control and link it during install
  config_home="${XDG_CONFIG_HOME:=$HOME/.config}"

  if [ -d "${HOME}/.yarn" ]; then
    ln -s "${HOME}/dotfiles/xdg/yarn" "${config_home}"
    yarn global add
  else
    yarn global upgrade
  fi
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
    gem install --user-install lolcat mailcatcher neovim sassc solargraph
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

grab_sassc() {
  (
    # sassc itself seems to be b0rken
    PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
    SASS_LIBSASS_PATH="${HOME}/contrib/libsass"
    SASS_VERSION='3.4.7'
    SASSC_PATH="${HOME}/contrib/sassc"
    grab_git -d "${SASS_LIBSASS_PATH}" -r https://github.com/hcatlin/libsass -b "${SASS_VERSION}" -n
    grab_git -d "${SASSC_PATH}" -r https://github.com/hcatlin/sassc -b "${SASS_VERSION}" -n

    cd "${SASSC_PATH}" && \
      SASS_LIBSASS_PATH="${SASS_LIBSASS_PATH}" PREFIX="${HOME}/.local" make -j4 install
  )
}
