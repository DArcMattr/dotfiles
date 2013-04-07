# My Dotfiles

## Requirements & Assumptions

* Vim with the Python 2.7 engine compiled in
* `hg` and `git` source control packages

## Installation:

Copy/paste the folliwing onto the command line:

    cd
    mkdir ~/contrib
    hg clone http://bitbucket.org/sjl/hg-prompt/ ~/contrib/
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim
    rm ~/.vimrc && ln -s ~/dotfiles/.vimrc
    rm ~/.bashrc && ln -s ~/dotfiles/.bashrc
    rm ~/.profile && ln -s ~/dotfiles/.profile
    rm ~/.bash_profile && ln -s ~/dotfiles/.bash_profile
    rm ~/.hgrc && ln -s ~/dotfiles/.hgrc
    rm ~/.gitconfig && ln -s ~/dotfiles/.gitconfig
    rm ~/.tmux.conf && ln -s ~/dotfiles/.tmux.conf
    rm ~/.Xmodmap && ln -s ~/dotfiles/.Xmodmap
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim -E -c BundleInstall -c BundleClean -c q

## TODO

1. copy/paste sections so I can drop and go on a new machine
1. generalize more setup files
1. `xkeycaps` usage instructions, .Xmodmap is a product of the utility

## Vagrant config for image

vagrant box add FBSD_devel https://s3.amazonaws.com/VagrantBoxen/freebsd_amd64_zfs.box
vagrant init FBSD_devel
vagrant up
