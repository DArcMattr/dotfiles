PIP=`which pip`

grab_neobundle() {
  if [ ! -d ~/.vim/bundle/neobundle.vim/.git/ ]; then
    git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  else
    cd ~/.vim/bundle/neobundle.vim
    git up
    cd -
  fi
}

grab_giteditor() {
  if [ ! -d ~/contrib/giteditor/.git/ ]; then
    git clone https://github.com/dharrigan/giteditor.git ~/contrib/giteditor
  else
    cd ~/contrib/giteditor
    git up
    cd -
  fi
}

build_wp_cli() {
  \cd ~/contrib/wp-cli
  git up
  git checkout "tags/v${1}"
  git submodule update --init --recursive
  if [ -f ~/contrib/wp-cli/composer.lock ]; then
    composer update
  else
    composer install
  fi
  # TODO build phar
  \sudo \rm -f /usr/local/bin/wp && \
    \sudo \ln -s ~/contrib/wp-cli/bin/wp /usr/local/bin/wp
}

grab_sassc() {
  # TODO: create a git hook to insert
  if [ ! -d ~/contrib/libsass/.git/ ]; then
    git clone https://github.com/hcatlin/libsass ~/contrib/libsass
    cd ~/contrib/libsass
    git submodule init --recursive
    cd -
  else
    cd ~/contrib/libsass
    git up
    git submodule update --recursive
    cd -
  fi

  if [ ! -d ~/contrib/sassc/.git/ ]; then
    git clone https://github.com/hcatlin/sassc ~/contrib/sassc
  else
    cd ~/contrib/sassc
    git up
    cd -
  fi
  echo "you will need to compile these yourself"
}

grab_wp_cli() {
  VER='0.17.0'
  if [ ! -d ~/contrib/wp-cli/.git/ ]; then
    git clone --recursive https://github.com/wp-cli/wp-cli.git ~/contrib/wp-cli/
    build_wp_cli ${VER}
  else
    CURR_VER=$(~/contrib/wp-cli/bin/wp --version)
    if [ "${CURR_VER}" != "WP-CLI ${VER}" ]; then
      build_wp_cli ${VER}
    fi
  fi
}

grab_hg_prompt() {
  if [ ! -d ~/contrib/hg-prompt/.hg/ ]; then
    hg clone https://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
  else
    \cd ~/contrib/hg-prompt
    hg pull -u
    \cd -
  fi
}

grab_hgcfg() {
  if [ ! -d ~/contrib/hgcfg/.hg/ ]; then
    hg clone https://bitbucket.org/bmearns/hgcfg ~/contrib/hgcfg
  else
    \cd ~/contrib/hgcfg
    hg pull -u
    \cd -
  fi
}

grab_powerline() {
  echo "installing/upgrading Powerline"
  \sudo $PIP install -U psutil
  \sudo $PIP install -U powerline-status

  powerline_path=$(dirname `python -c 'import powerline; print (powerline.__file__)'`)
  if [ ! -d ~/.config/powerline ]; then
    mkdir -p ~/.config/powerline
    \cp -R ${powerline_path}/config_files/* ~/.config/powerline
  fi
  if [ ! -f ~/.config/powerline/powerline.conf ]; then
    \ln -s \
      ${powerline_path}/bindings/tmux/powerline.conf \
      ~/.config/powerline/powerline.conf
  fi
}

grab_s3cmd() {
  VER="s3cmd version 1.5.0-beta1"
  CURR_VER="$(s3cmd --version 2>&1)"
  if [ "$CURR_VER" = "$VER" ]; then
    echo "s3cmd currently installed and up to date"
  else
    echo "installing/upgrading s3cmd"
    \sudo $PIP install -U s3cmd==1.5.0-alpha3
  fi
}

grab_composer() {
  if ! command -v composer >/dev/null 2>&1 ; then
    \cd /tmp
    \curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"
    \sudo \mv composer.phar /usr/local/bin/composer
    \cd -
  else
    sudo composer self-update
  fi
}
