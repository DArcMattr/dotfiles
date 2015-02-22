#!/bin/sh
# only idempotent commands here so far
# TODO: translate to ansible

\mkdir -p ~/contrib ~/.vim/{syntax,bundle} ~/bin
\chmod 600 ~/dotfiles/sshconfig

for i in $(find ~/dotfiles/symlinks/ -maxdepth 1); do
  \rm -rf ~/$(basename ${i})
  \ln -s ${i} ~/$(basename ${i})
done

. ~/dotfiles/init_libs.sh

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
