#!/bin/sh
# only idempotent commands here so far
# TODO: translate to ansible

\mkdir -p ~/contrib ~/.vim/{syntax,bundle} ~/bin
\chmod 600 ~/dotfiles/sshconfig

dotfiles=".Xmodmap .bash_profile .bashrc .editrc .gitconfig .hgrc .inputrc .pandoc .tmux.conf .vimrc .zprofile .zshenv .zshrc .zlogin .zpreztorc"

while read i; do
  \rm -rf ~/${i}
  \ln -s ~/dotfiles/${i} ~/${i}
done < <(echo ${dotfiles} | tr ' ' '\n')

source ~/dotfiles/init_libs.sh

grab_composer
grab_neobundle
grab_hgcfg
grab_hg_prompt
grab_wp_cli
grab_powerline
grab_s3cmd
grab_sassc
grab_icdiff

composer global require 'phpmd/phpmd=*'
composer global require 'squizlabs/php_codesniffer=*'
composer global require 'phing/phing=*'
composer global require 'psy/psysh=*'

cd ~/dotfiles
hg cfg --local hooks.update "chmod 600 ~/dotfiles/sshconfig"
hg cfg --local paths.default "ssh://hg@bitbucket.org/darceneaux/dotfiles"
cd -
