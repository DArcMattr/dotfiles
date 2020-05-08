#!/usr/bin/env zsh
# only idempotent commands here so far
# TODO: translate to ansible

DOT_CONFIG=${XDG_CONFIG_HOME:=$HOME/.config}

mkdir -p "${HOME}/contrib" "${HOME}/.local/bin" "${DOT_CONFIG}"
chmod 600 ~/dotfiles/sshconfig
mv ~/.ssh/config ~/.ssh/config.orig
ln -s ~/dotfiles/sshconfig ~/.ssh/config
tic -x ~/dotfiles/tmux-256color.terminfo

find ~/dotfiles/symlinks/ -name ".*" -exec ln -sf "{}" "${HOME}" \;
find "${HOME}/dotfiles/xdg/" -mindepth 1 -maxdepth 1 -type d -exec ln -sf "{}" "${DOT_CONFIG}/" \;

(
  zsh ~/dotfiles/init_libs.sh

  grab_composer
  grab_pips
  grab_gems
  grab_yarns
  grab_git -d ~/contrib/the_silver_searcher -r https://github.com/ggreer/the_silver_searcher.git -b master
  grab_git -d ~/contrib/ctags               -r https://github.com/universal-ctags/ctags.git      -b master
  grab_git -d ~/contrib/tmux                -r https://github.com/tmux/tmux.git
  grab_git -d ~/contrib/autoenv             -r https://github.com/zpm-zsh/autoenv.git -n
)
