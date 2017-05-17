#!/bin/sh
grab_wp_cli() {
  (
    INSTALL_PATH="${HOME}/contrib/wp-cli"
    if [ ! -d "${INSTALL_PATH}" ]; then
      mkdir -p "${INSTALL_PATH}" && cd "${INSTALL_PATH}"
      curl -O \
        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
      chmod +x "${INSTALL_PATH}/wp-cli.phar"
      ln -s "${INSTALL_PATH}/wp-cli.phar" "${HOME}/.local/bin/wp"
    else
      cd "${INSTALL_PATH}"
      curl -O \
        https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    fi
    curl -s \
      https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash \
      -o ~/contrib/wp-completion.bash
  )
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

  pip  install -U --user neovim s3cmd
  pip3 install -U --user doge httpie icdiff neovim psutil powerline-status

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
        cd "${INSTALL_PATH}" &&
        git checkout "$(git describe --abbrev=0 --tags)"
        phpcs --config-set installed_paths "${INSTALL_PATH}"
    else
      cd "${INSTALL_PATH}" &&
        git fetch &&
        git checkout "$(git describe --abbrev=0 --tags)"
    fi
  )
}

grab_gems() {
  if which ruby >/dev/null && which gem >/dev/null; then
    gem install --user-install neovim sass lolcat
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
    SASS_LIBSASS_PATH="${HOME}/contrib/libsass"
    grab_git -d ${SASS_LIBSASS_PATH} -r https://github.com/hcatlin/libsass -n

    SASSC_PATH="${HOME}/contrib/sassc"
    grab_git -d ${SASSC_PATH} -r https://github.com/hcatlin/sassc -n

    cd "${SASSC_PATH}" && \
      SASS_LIBSASS_PATH="${SASS_LIBSASS_PATH}" PREFIX="${HOME}/.local" \
      make install
  )
}
