#!/bin/sh
grab_sassc() {
  LIBSASS_PATH="${HOME}/contrib/libsass"
  if [ ! -d "${LIBSASS_PATH}/.git/" ]; then
    git clone https://github.com/hcatlin/libsass "${LIBSASS_PATH}"
    (
      cd "${LIBSASS_PATH}" &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  else
    (
      cd "${LIBSASS_PATH}" && git fetch &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  fi

  SOURCE_PATH="${HOME}/contrib/sassc"
  if [ ! -d "${SOURCE_PATH}/.git/" ]; then
    git clone https://github.com/hcatlin/sassc "${SOURCE_PATH}"
    (
      cd "${SOURCE_PATH}" &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  else
    (
      cd "${SOURCE_PATH}" && git fetch &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  fi

  (
    cd "${SOURCE_PATH}" &&
    SASS_LIBSASS_PATH="${LIBSASS_PATH}" PREFIX="${HOME}/.local" make install
  )
}

grab_wp_cli() {
  INSTALL_PATH="${HOME}/contrib/wp-cli"
  if [ ! -d "${INSTALL_PATH}" ]; then
    (
      mkdir -p "${INSTALL_PATH}" && cd "${INSTALL_PATH}"
      curl -O \
        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
      chmod +x "${INSTALL_PATH}/wp-cli.phar"
      ln -s "${INSTALL_PATH}/wp-cli.phar" "${HOME}/.local/bin/wp"
    )
  else
    (
      cd "${INSTALL_PATH}"
      curl -O \
        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    )
  fi
}

grab_autoenv() {
  INSTALL_PATH="${HOME}/contrib/autoenv"
  if [ ! -d "${INSTALL_PATH}/.git" ]; then
    git clone https://github.com/horosgrisa/autoenv.git ${INSTALL_PATH}
  else
    ( cd "${INSTALL_PATH}" && git up )
  fi
}

grab_hgcfg() {
  INSTALL_PATH="${HOME}/contrib/hgcfg"
  if [ ! -d "${INSTALL_PATH}/.hg/" ]; then
    hg clone https://bitbucket.org/bmearns/hgcfg "${INSTALL_PATH}"
  else
    ( cd "${INSTALL_PATH}" && hg pull -u )
  fi
}

grab_pips() {
  config_home="${XDG_CONFIG_HOME:=$HOME/.config}"

  pip install -U --user s3cmd
  pip3 install -U --user psutil powerline-status httpie neovim icdiff doge

  if [ ! -d "${config_home}/powerline" ]; then
    mkdir -p "${config_home}/powerline"
  fi

  powerline_path="$(dirname "$(python3 -c 'import powerline; print (powerline.__file__)')")"

  rsync -a --prune-empty-dirs --include '*/' "${powerline_path}/config_files/" \
    "${config_home}/powerline"

  if [ ! -f "${config_home}/powerline/powerline.conf" ]; then
    ln -s \
      "${powerline_path}/bindings/tmux/powerline.conf" \
      "${config_home}/powerline/powerline.conf"
  fi
}

grab_composer() {
  if ! command -v composer >/dev/null 2>&1 ; then
    ( cd /tmp; \
      curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"; \
      mv composer.phar ~/bin/composer
      cd ~
      composer global require 'phpmd/phpmd=*' \
        'squizlabs/php_codesniffer=*' \
        'phing/phing=*' \
        'psy/psysh=*' \
        'phpunit/phpunit=6.*'
    )
  else
    composer self-update
    composer global update
  fi

  (
    INSTALL_PATH="${HOME}/contrib/wpcs"
    if [ ! -d "${INSTALL_PATH}/.git" ]; then
      git clone \
        https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git \
        "${INSTALL_PATH}" &&
      (
        cd "${INSTALL_PATH}" &&
        git checkout "$(git describe --abbrev=0 --tags)"
        phpcs --config-set installed_paths "${INSTALL_PATH}"
      )
    else
      (
        cd "${INSTALL_PATH}" &&
          git fetch &&
          git checkout "$(git describe --abbrev=0 --tags)"
      )
    fi
  )
}

grab_tpm() {
  INSTALL_PATH="${HOME}/.tmux/plugins/tpm"
  if [ ! -d "${INSTALL_PATH}/.git/" ]; then
    git clone https://github.com/tmux-plugins/tpm.git "${INSTALL_PATH}"
  else
    ( cd "${INSTALL_PATH}" && git up )
  fi
}

grab_nvm() {
  INSTALL_PATH="${HOME}/.nvm/"
  if [ ! -d "${INSTALL_PATH}/.git/" ]; then
    git clone https://github.com/creationix/nvm.git "${INSTALL_PATH}" && (
      cd "${INSTALL_PATH}" &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  else
    (
      cd "${INSTALL_PATH}" &&
      git fetch &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  fi
}

grab_gems() {
  if which ruby >/dev/null && which gem >/dev/null; then
    gem install --user-install neovim sass lolcat
  fi
}

grab_ctags() {
  INSTALL_PATH="${HOME}/contrib/ctags"
  if [ ! -d "${INSTALL_PATH}/.git" ]; then
    git clone https://github.com/universal-ctags/ctags.git \
      "${INSTALL_PATH}" && (
      cd "${INSTALL_PATH}" &&
        git checkout master
    )
  else
    (
      cd "${INSTALL_PATH}" &&
      git fetch &&
      git checkout master
    )
  fi

  cd "${INSTALL_PATH}" && \
  ./autogen.sh && \
  ./configure --prefix="${HOME}/.local" && \
  make install clean
}
