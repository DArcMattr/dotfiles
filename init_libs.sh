#!/bin/sh
grab_hgcfg() {
  INSTALL_PATH="${HOME}/contrib/hgcfg"
  if [ ! -d "${INSTALL_PATH}/.hg/" ]; then
    hg clone https://bitbucket.org/bmearns/hgcfg "${INSTALL_PATH}"
  else
    ( cd "${INSTALL_PATH}" && hg pull -u )
  fi
}

grab_rust() {
  if [ ! -x "${HOME}/.cargo/bin" ] && [ ! "$(which rustc >/dev/null)" ]; then
    curl https://sh.rustup.rs -sSf | sh
    rehash
  else
    rustup self update
  fi

  mkdir -p "${HOME}/.zfunc" && \
    rm "${HOME}/.zfunc/_rustup" && \
    "${HOME}/.cargo/bin/rustup" completions zsh > "${HOME}/.zfunc/_rustup"

  cd ~ && cargo install cargo-deb cargo-update exa
}

grab_pips() {
  config_home="${XDG_CONFIG_HOME:=$HOME/.config}"

  pip2 install -U --user neovim mercurial pip s3cmd
  pip3 install -U --user doge flake8 gsutil httpie icdiff neovim pip psutil \
    powerline-status pyemojify

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
  if ! command -v composer >/dev/null 2>&1 ; then
    (
      config_home="${XDG_CONFIG_HOME:=$HOME/.config}"
      mkdir -p "${HOME}/.local/bin"
      if [ ! -d "${config_home}/composer" ]; then
        ln -s "${HOME}/dotfiles/xdg/composer" "${config_home}/composer"
      fi
      cd "${TMP}" || exit
      curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"; \
        mv composer.phar "${HOME}/.local/bin/composer"
      # TODO: code around phpcs paths
      cd "${HOME}" || exit
      composer global install
    )
  else
    composer self-update
    composer global update
  fi
}

grab_gems() {
  if which ruby >/dev/null && which gem >/dev/null; then
    gem install --user-install lolcat neovim sass
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
