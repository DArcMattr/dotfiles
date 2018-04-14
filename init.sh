#!/bin/sh
# only idempotent commands here so far
# TODO: translate to ansible

DOT_CONFIG=${XDG_CONFIG_HOME:=$HOME/.config}

mkdir -p ~/contrib ~/.local/bin
chmod 600 ~/dotfiles/sshconfig
mv ~/.ssh/config ~/.ssh/config.orig
ln -s ~/dotfiles/sshconfig ~/.ssh/config
ln -s ~/dotfiles/xdg/git      "${DOT_CONFIG}/git"
ln -s ~/dotfiles/xdg/htop     "${DOT_CONFIG}/htop"
ln -s ~/dotfiles/xdg/composer "${DOT_CONFIG}/composer"
ln -s ~/dotfiles/xdg/nvim     "${DOT_CONFIG}/nvim"
tic -x ~/dotfiles/tmux-256color.terminfo

find ~/dotfiles/symlinks/ -name ".*" -exec ln -sf "{}" "${HOME}" \;
#find ~/dotfiles/xdg/nvim/ -maxdepth 1 -mindepth 1 -exec ln -sf "{}" "${HOME}/${DOT_CONFIG}/nvim" \;

(
  . ~/dotfiles/init_libs.sh

  grab_composer
  grab_wp_cli
  grab_pips
  grab_gems
  grab_yarns
  grab_sassc
  grab_git -d ~/contrib/the_silver_searcher -r https://github.com/ggreer/the_silver_searcher.git -b master
  grab_git -d ~/contrib/ctags               -r https://github.com/universal-ctags/ctags.git      -b master
  grab_git -d ~/contrib/tmux                -r https://github.com/tmux/tmux.git
  grab_git -d ~/.nvm                        -r https://github.com/creationix/nvm.git -n
  grab_git -d ~/.tmux/plugins/tpm           -r https://github.com/tmux-plugins/tpm.git -n
  grab_git -d ~/contrib/autoenv             -r https://github.com/darcmattr/autoenv.git -n

  # cd ~/dotfiles && \
  #   hg config hooks.update "chmod 600 ~/dotfiles/sshconfig"
)
