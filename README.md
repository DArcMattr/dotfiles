# My Dotfiles

## Installation:

Copy/paste the folliwing onto the command line:

    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim
    ln -s ~/dotfiles/.vimrc ~/.vimrc
    ln -s ~/dotfiles/.bashrc ~/.bashrc
    ln -s ~/dotfiles/.profile ~/.profile
    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.hgrc ~/.hgrc
    ln -s ~/dotfiles/.gitconfig ~/.gitconfig
    ln -s ~/dotfiles/tmux.conf ~/tmux.conf
    ln -s ~/dotfiles/.xmodmap ~/.xmodmap
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

Open up `vim`, and run `:BundleInstall`

## TODO

1. copy/paste sections so I can drop and go on a new machine
2. generalize more setup files
3. xkeycaps usage instructions, .xmodmap is a product of the utility
