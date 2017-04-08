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
  INSTALL_PATH="${HOME}/bin/wp-cli"
  if [ ! -d "${INSTALL_PATH}" ]; then
    mkdir -p "${INSTALL_PATH}" && cd "${INSTALL_PATH}"
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x "${INSTALL_PATH}/wp-cli.phar"
    ln -s "${INSTALL_PATH}/wp-cli.phar" ~/bin/wp
  else
    cd "${INSTALL_PATH}"
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  fi
}

grab_hg_prompt() {
  INSTALL_PATH="${HOME}/contrib/hg-prompt"
  if [ ! -d "${INSTALL_PATH}/.hg/" ]; then
    hg clone https://bitbucket.org/sjl/hg-prompt "${INSTALL_PATH}"
  else
    ( cd "${INSTALL_PATH}" && hg pull -u )
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
  # I install mercurial via hg on Ubuntu, because the package version is out of
  # date and drags in all kinds of X dependencies
  pip install -U psutil powerline-status s3cmd dulwich httpie neovim icdiff

  powerline_path="$(dirname "$(python -c 'import powerline; print (powerline.__file__)')")"
  if [ ! -d "${XDG_CONFIG_HOME:=$HOME/.config}/powerline" ]; then
    mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}/powerline"
  fi
  rsync -a --prune-empty-dirs --include '*/' "${powerline_path}/config_files/" \
    "${XDG_CONFIG_HOME:=$HOME/.config}/powerline"

  if [ ! -f ~/.config/powerline/powerline.conf ]; then
    ln -s \
      "${powerline_path}/bindings/tmux/powerline.conf" \
      "${XDG_CONFIG_HOME:=$HOME/.config}/powerline/powerline.conf"
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

grab_sniffs() {
  INSTALL_PATH="${HOME}/contrib/wpcs"
  if [ ! -d "${INSTALL_PATH}/.git" ]; then
    git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git "${INSTALL_PATH}" && (
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
}
