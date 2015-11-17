#!/bin/sh
grab_sassc() {
  # TODO: create a git hook to insert
  if [ ! -d ~/contrib/libsass/.git/ ]; then
    git clone https://github.com/hcatlin/libsass ~/contrib/libsass
    ( cd ~/contrib/libsass; git submodule init --recursive )
  else
    ( cd ~/contrib/libsass; git up; git submodule update --recursive; )
  fi

  if [ ! -d ~/contrib/sassc/.git/ ]; then
    git clone https://github.com/hcatlin/sassc ~/contrib/sassc
  else
    ( cd ~/contrib/sassc; git up )
  fi
  echo "you will need to compile these yourself"
}

grab_vimplug() {
  mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
  if [ ! -f "${XDG_CONFIG_HOME}/nvim/autoload/plug.vim" ]; then
    curl -fLo "${XDG_CONFIG_HOME}/nvim/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

grab_wp_cli() {
  if [ ! -d ~/contrib/wp-cli/.git ]; then
    git clone https://github.com/wp-cli/wp-cli.git ~/contrib/wp-cli
    ( cd ~/contrib/wp-cli && composer update )
    ln -s ~/contrib/wp-cli/bin/wp ~/bin/wp
  else
    ( cd ~/contrib/wp-cli && git up && composer update )
  fi
}

grab_hg_prompt() {
  if [ ! -d ~/contrib/hg-prompt/.hg/ ]; then
    hg clone https://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
  else
    ( cd ~/contrib/hg-prompt; hg pull -u )
  fi
}

grab_autoenv() {
  if [ ! -d ~/contrib/autoenv/.git ]; then
    git clone https://github.com/horosgrisa/autoenv.git ~/contrib/autoenv
    ln -s ~/contrib/autoenv "${ZSH_CUSTOM}/plugins/"
  else
    ( cd ~/contrib/autoenv; git up )
  fi
}

grab_hgcfg() {
  if [ ! -d ~/contrib/hgcfg/.hg/ ]; then
    hg clone https://bitbucket.org/bmearns/hgcfg ~/contrib/hgcfg
  else
    ( cd ~/contrib/hgcfg; hg pull -u )
  fi
}

grab_powerline() {
  echo "installing/upgrading Powerline"
  sudo pip install -U psutil powerline-status

  powerline_path="$(dirname `python -c 'import powerline; print (powerline.__file__)'`)"
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

grab_s3cmd() {
  VER="1.6.0"
  VER_STRING="s3cmd version ${VER}"
  CURR_VER="$(s3cmd --version 2>&1)"
  if [ "$CURR_VER" = "$VER_STRING" ]; then
    echo "s3cmd currently installed and up to date"
  else
    echo "installing/upgrading s3cmd"
    sudo pip install -U s3cmd==${VER}
  fi
}

grab_composer() {
  if ! command -v composer >/dev/null 2>&1 ; then
    ( cd /tmp; \
      curl -sS https://getcomposer.org/installer | php -d "allow_url_fopen=On"; \
      sudo mv composer.phar /usr/local/bin/composer )
  else
    sudo composer self-update
  fi
}

grab_icdiff() {
  if ! command -v icdiff >/dev/null 2>&1 ; then
    git clone https://github.com/jeffkaufman/icdiff.git ~/contrib/icdiff
    ln -s ~/contrib/icdiff ~/bin/icdiff
  else
    ( cd ~/contrib/icdiff; git up )
  fi
}

grab_tpm() {
  if [ ! -d ~/.tmux/plugins/tpm/.git/ ]; then
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
  else
    ( cd ~/.tmux/plugins/tpm; git up )
  fi
}
