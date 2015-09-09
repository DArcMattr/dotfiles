PIP=`which pip`

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
    \git clone https://github.com/hcatlin/sassc ~/contrib/sassc
  else
    \cd ~/contrib/sassc
    \git up
    \cd -
  fi
  echo "you will need to compile these yourself"
}

grab_vimplug() {
  if [ ! -f ~/.nvim/autoload/plug.vim ]; then
    curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

grab_wp_cli() {
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ~/contrib
  chmod +x ~/contrib/wp-cli.phar
  ln -s ~/contrib/wp-cli.phar ~/bin/wp
}

grab_hg_prompt() {
  if [ ! -d ~/contrib/hg-prompt/.hg/ ]; then
    \hg clone https://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
  else
    \cd ~/contrib/hg-prompt
    \hg pull -u
    \cd -
  fi
}

grab_hgcfg() {
  if [ ! -d ~/contrib/hgcfg/.hg/ ]; then
    \hg clone https://bitbucket.org/bmearns/hgcfg ~/contrib/hgcfg
  else
    \cd ~/contrib/hgcfg
    \hg pull -u
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
  VER="1.5.2"
  VER_STRING="s3cmd version ${VER}"
  CURR_VER="$(s3cmd --version 2>&1)"
  if [ "$CURR_VER" = "$VER_STRING" ]; then
    echo "s3cmd currently installed and up to date"
  else
    echo "installing/upgrading s3cmd"
    \sudo $PIP install -U s3cmd==$VER
  fi
}

grab_composer() {
  if ! command -v composer >/dev/null 2>&1 ; then
    \cd /tmp
    \curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"
    \sudo \mv composer.phar /usr/local/bin/composer
    \cd -
  else
    \sudo composer self-update
  fi
}

grab_icdiff() {
  if ! command -v icdiff >/dev/null 2>&1 ; then
    \git clone https://github.com/jeffkaufman/icdiff.git ~/contrib/icdiff
    \ln -s ~/contrib/icdiff ~/bin/icdiff
  else
    \cd ~/contrib/icdiff
    \git up
    \cd -
  fi
}

grab_tpm() {
  if [ ! -d ~/.tmux/plugins/tpm/.git/ ]; then
    \git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
  else
    \cd ~/.tmux/plugins/tpm
    \git up
    \cd -
  fi
}
