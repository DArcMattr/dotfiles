#!/bin/sh
# only idempotent commands here so far

mkdir -p ~/contrib ~/.vim/{syntax,bundle} ~/.config/powerline
chmod 600 ~/dotfiles/sshconfig

dotfiles=".vimrc .bashrc .zshrc .profile .bash_profile .hgrc .gitconfig .tmux.conf .Xmodmap .pandoc"
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

grab_git_diffall() {
  if [ ! -d ~/contrib/git-diffall/.git/ ]; then
    git clone https://github.com/thenigan/git-diffall.git ~/contrib/git-diffall
  else
    cd ~/contrib/git-diffall
    git up
    cd -
  fi
}

build_wp_cli() {
  cd ~/contrib/wp-cli
  git checkout "tags/v${1}"
  git submodule update --init --recursive
  if [ -f ~/contrib/wp-cli/composer.lock ]; then
    composer update
  else
    composer install
  fi
  # TODO build phar
  sudo rm /usr/local/bin/wp && \
    sudo ln -s ~/contrib/wp-cli/bin/wp /usr/local/bin/wp
}

grab_wp_cli() {
  VER='0.15.0'
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
    cd ~/contrib/hg-prompt
    hg pull -u
    cd -
  fi
}

grab_powerline() {
  echo "installing/upgrading Powerline"
  sudo $PIP install -U https://github.com/Lokaltog/powerline/tarball/develop

  powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename')
  if [ ! -d ~/.config/powerline ]; then
    cp -R ${powerline_path}/config_files/* ~/.config/powerline
  fi
  if [ ! -f ~/.config/powerline/powerline.conf ]; then
    ln -s \
      ${powerline_path}/bindings/tmux/powerline.conf \
      ~/.config/powerline/powerline.conf
  fi
}

grab_s3cmd() {
  echo "installing/upgrading s3cmd"
  sudo $PIP install -U https://github.com/s3tools/s3cmd/archive/master.zip
}

grab_giteditor
grab_git_diffall
grab_neobundle
grab_hg_prompt
grab_wp_cli
grab_powerline
grab_s3cmd
