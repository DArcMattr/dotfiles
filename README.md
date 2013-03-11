# My Dotfiles

## Requirements & Assumptions

* Vim with the Python 2.7 engine compiled in
* `hg` and `git` source control packages

## Installation:

Copy/paste the folliwing onto the command line:

    cd
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim
    ln -s ~/dotfiles/.vimrc
    ln -s ~/dotfiles/.bashrc
    ln -s ~/dotfiles/.profile
    ln -s ~/dotfiles/.bash_profile
    ln -s ~/dotfiles/.hgrc
    ln -s ~/dotfiles/.gitconfig
    ln -s ~/dotfiles/.tmux.conf
    ln -s ~/dotfiles/.xmodmap
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim -E -c BundleInstall -c q

## TODO

1. copy/paste sections so I can drop and go on a new machine
1. generalize more setup files
1. `xkeycaps` usage instructions, .xmodmap is a product of the utility
