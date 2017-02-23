#!/bin/sh
# only idempotent commands here so far
# TODO: translate to ansible

mkdir -p ~/contrib ~/bin ~/.config/git ~/.config/nvim
chmod 600 ~/dotfiles/sshconfig
mv ~/.ssh/config ~/.ssh/config.orig
ln -s ~/dotfiles/sshconfig ~/.ssh/config
ln -s ~/dotfiles/xdg/git/config ~/.config/git/config
ln -s ~/dotfiles/xdg/git/attributes ~/.config/git/attributes
ln -s ~/dotfiles/xdg/git/template ~/.config/git/template
ln -s ~/dotfiles/xdg/nvim/init.vim ~/.config/nvim/init.vim
tic -x ~/dotfiles/tmux-256color.terminfo

find ~/dotfiles/symlinks/ -name ".*" -exec ln -sf "{}" "${HOME}" \;

(
  . ~/dotfiles/init_libs.sh

  grab_hgcfg
  grab_hg_git
  grab_hg_prompt
  grab_composer
  grab_wp_cli
  grab_pips
  grab_sassc
  grab_tpm
  grab_nvm
  grab_autoenv
)

composer global require 'phpmd/phpmd=*' \
  'squizlabs/php_codesniffer=*' \
  'phing/phing=*' \
  'psy/psysh=*'

(
  cd ~/dotfiles &&
  hg cfg --local hooks.update "chmod 600 ~/dotfiles/sshconfig" &&
  hg cfg --local paths.default "ssh://hg@bitbucket.org/darceneaux/dotfiles"
)
