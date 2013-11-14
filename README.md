# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

* Vim with the Python 2.7 engine compiled in
* `hg` and `git` source control packages

## Installation:

Copy/paste the folliwing onto the command line:

    cd ~
    curl -L \
      https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh \
      | sh

Refresh the session, then run the following:

    cp ~/dotfiles/dca.zsh-theme ~/.oh-my-zsh/themes/dca.zsh-theme
    cp -R ~/dotfiles/neobundle ~/.oh-my-zsh/plugins/
    rm ~/.vimrc ~/.bashrc ~/.zshrc ~/.profile ~/.bash_profile ~/.hgrc \
      ~/.gitconfig ~/.tmux.conf ~/.Xmodmap
    ln -s ~/dotfiles/.vimrc
    ln -s ~/dotfiles/.bashrc
    ln -s ~/dotfiles/.zshrc
    ln -s ~/dotfiles/.profile
    ln -s ~/dotfiles/.bash_profile
    ln -s ~/dotfiles/.hgrc
    ln -s ~/dotfiles/.gitconfig
    ln -s ~/dotfiles/.tmux.conf
    ln -s ~/dotfiles/.Xmodmap
    mkdir -p ~/{contrib,.vim/syntax}
    hg clone http://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim

    git clone https://github.com/thenigan/git-diffall.git ~/contrib/git-diffall
    git clone https://github.com/dharrigan/giteditor.git ~/contrib/giteditor

Refresh your login session to pick up all the dotfile updates, then run:

    neobundle-update
    neobundle-clean

## TODO

1. `xkeycaps` usage instructions, .Xmodmap is a product of the utility, and
   different machines may have different keycodes

## Vagrant config for image

    vagrant box add \
      FBSD_devel \
      https://s3.amazonaws.com/VagrantBoxen/freebsd_amd64_zfs.box
    vagrant init FBSD_devel
    vagrant up

## `st` notes

Under KDE:

For running st:

    kstart --maximize --windowclass "st-256color" st -e tmux attach
