#!/bin/sh
# only idempotent commands here so far
# TODO: translate to ansible

mkdir -p ~/contrib ~/.vim/syntax ~/.vim/bundle ~/bin
chmod 600 ~/dotfiles/sshconfig

find ~/dotfiles/symlinks/ -name ".*" -exec ln -sf "{}" "${HOME}" \;

. ~/dotfiles/init_libs.sh

grab_composer
grab_hgcfg
grab_hg_git
grab_wp_cli
grab_pips
grab_sassc
grab_tpm
grab_nvm
grab_autoenv

composer global require 'phpmd/phpmd=*' \
  'squizlabs/php_codesniffer=*' \
  'phing/phing=*' \
  'psy/psysh=*'

(
  cd ~/dotfiles &&
  hg cfg --local hooks.update "chmod 600 ~/dotfiles/sshconfig" &&
  hg cfg --local paths.default "ssh://hg@bitbucket.org/darceneaux/dotfiles"
)
