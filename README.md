# My Dotfiles

## Requirements & Assumptions

* Vim with the Python 2.7 engine compiled in
* `hg` and `git` source control packages

## Installation:

Copy/paste the folliwing onto the command line:

    cd
    mkdir ~/contrib
    hg clone http://bitbucket.org/sjl/hg-prompt/ ~/contrib/hg-prompt/
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    cp -s ~/dotfiles/dca.zsh-theme ~/.oh-my-zsh/themes/dca.zsh-theme
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
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    git clone https://github.com/thenigan/git-diffall.git ~/contrib/git-diffall
    git clone https://github.com/dharrigan/giteditor.git ~/contrib/giteditor
    vim -E -c BundleInstall -c BundleClean -c q

## TODO

1. copy/paste sections so I can drop and go on a new machine
1. generalize more setup files
1. `xkeycaps` usage instructions, .Xmodmap is a product of the utility

## Vagrant config for image

    vagrant box add FBSD_devel https://s3.amazonaws.com/VagrantBoxen/freebsd_amd64_zfs.box
    vagrant init FBSD_devel
    vagrant up
