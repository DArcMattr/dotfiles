#!/bin/sh
# only idempotent commands here so far

mkdir -p ~/contrib ~/.vim/{syntax,bundle} ~/.config/powerline
chmod 600 ~/dotfiles/sshconfig

dotfiles=".vimrc .bashrc .zshrc .profile .bash_profile .hgrc .gitconfig .tmux.conf .Xmodmap .pandoc"
PIP=`which pip`

if [ ! -d ~/.vim/bundle/neobundle.vim/.git/ ]; then
  git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
  cd ~/.vim/bundle/neobundle.vim
  git up
  cd -
fi

if [ ! -d ~/contrib/giteditor/.git/ ]; then
  git clone https://github.com/dharrigan/giteditor.git ~/contrib/giteditor
else
  cd ~/contrib/giteditor
  git up
  cd -
fi

if [ ! -d ~/contrib/git-diffall/.git/ ]; then
  git clone https://github.com/thenigan/git-diffall.git ~/contrib/git-diffall
else
  cd ~/contrib/git-diffall
  git up
  cd -
fi

grab_wp_completion() {
  if [ ! -d ~/contrib/wp-completions/ ]; then
    mkdir -p ~/contrib/wp-completion
  fi

  curl \
    https://raw.githubusercontent.com/wp-cli/wp-cli/master/utils/wp-completion.bash > \
      ~/contrib/wp-completion/wp-completion.bash
}

if [ ! -d ~/contrib/hg-prompt/.hg/ ]; then
  hg clone https://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
else
  cd ~/contrib/hg-prompt
  hg pull -u
  cd -
fi

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

grab_wp_completion
grab_powerline
