#!/bin/sh

mkdir -p ~/{contrib,.vim/{syntax,bundle/neobundle.vim/},.config/powerline}
dotfiles=".vimrc .bashrc .zshrc .profile .bash_profile .hgrc .gitconfig .tmux.conf .Xmodmap"
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

if [ ! -d ~/contrib/hg-prompt/.hg/ ]; then
  hg clone http://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
else
  cd ~/contrib/hg-prompt
  hg pull -u
  cd -
fi

sudo $PIP install -U https://github.com/Lokaltog/powerline/tarball/develop

powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename')
cp -R ${powerline_path}/config_files/* ~/.config/powerline
