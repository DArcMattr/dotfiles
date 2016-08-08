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

  INSTALL_PATH="${HOME}/contrib/sassc"
  if [ ! -d "${INSTALL_PATH}/.git/" ]; then
    git clone https://github.com/hcatlin/sassc "${INSTALL_PATH}"
    (
      cd "${INSTALL_PATH}" &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  else
    (
      cd "${INSTALL_PATH}" && git fetch &&
      git checkout "$(git describe --abbrev=0 --tags)"
    )
  fi

  ( cd "${INSTALL_PATH}" && SASS_LIBSASS_PATH="${LIBSASS_PATH}" make )
}

grab_wp_cli() {
  INSTALL_PATH="${HOME}/contrib/wp-cli"
  if [ ! -d "$INSTALL_PATH/.git" ]; then
    git clone https://github.com/wp-cli/wp-cli.git "${INSTALL_PATH}"
    (
      cd "${INSTALL_PATH}" && git fetch &&
      git checkout "$(git describe --abbrev=0 --tags)" && composer update
    )
    ln -s "${INSTALL_PATH}/bin/wp" ~/bin/wp
  else
    (
      cd "${INSTALL_PATH}" && git fetch &&
      git checkout "$(git describe --abbrev=0 --tags)" && composer update
    )
  fi
}

grab_hg_git() {
  INSTALL_PATH="${HOME}/contrib/hg-git"
  if [ ! -d "${INSTALL_PATH}/.hg/" ]; then
    hg clone https://bitbucket.org/durin42/hg-git "${INSTALL_PATH}"
  else
    ( cd "${INSTALL_PATH}" && hg pull -u )
  fi
}

grab_hg_prompt() {
  INSTALL_PATH="${HOME}/contrib/hg-prompt"
  if [ ! -d "${INSTALL_PATH}/.hg/" ]; then
    hg clone https://bitbucket.org/sjl/hg-prompt/ "${INSTALL_PATH}"
  else
    ( cd "${INSTALL_PATH}" && hg pull -u )
  fi
}

grab_autoenv() {
  INSTALL_PATH="${HOME}/contrib/autoenv"
  if [ ! -d "${INSTALL_PATH}/.git" ]; then
    git clone https://github.com/horosgrisa/autoenv.git ~/contrib/autoenv
    ln -s "${INSTALL_PATH}" "${ZSH_CUSTOM}/plugins/"
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
  sudo pip install -U psutil powerline-status s3cmd dulwich httpie neovim icdiff

  powerline_path="$(dirname "$(python -c 'import powerline; print (powerline.__file__)')")"
  if [ ! -d "${XDG_CONFIG_HOME}/powerline" ]; then
    mkdir -p "${XDG_CONFIG_HOME}/powerline"
    cp -R "${powerline_path}/config_files/*" "${XDG_CONFIG_HOME}/powerline"
  fi

  if [ ! -f ~/.config/powerline/powerline.conf ]; then
    ln -s \
      "${powerline_path}/bindings/tmux/powerline.conf" \
      "${XDG_CONFIG_HOME}/powerline/powerline.conf"
  fi
}

grab_composer() {
  if ! command -v composer >/dev/null 2>&1 ; then
    ( cd /tmp; \
      curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"; \
      mv composer.phar ~/bin/composer )
  else
    composer self-update
  fi
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
