# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

* Vim with the Python 2.7 engine compiled in, and ability to use `pip` with all
    the necessary permissions
* `zsh` is available as a shell
* `hg` and `git` source control programs
* `hggit` package is installed through pip or package control
* `composer.phar` is installed on a system-wide level

## `.hg/hgrc`

There should be the following lines in this project's `.hg/hgrc` file:

    [hooks]
    update = chmod 600 sshconfig

## Installation:

Copy/paste the following onto the command line:

    cd ~
    curl -L \
      https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh \
      | sh

Refresh the session, then run the following:

    chmod 600 ~/dotfiles/sshconfig
    cp ~/dotfiles/dca.zsh-theme ~/.oh-my-zsh/themes/dca.zsh-theme
    rm ~/.nvimrc ~/.vimrc ~/.bashrc ~/.zshrc ~/.profile ~/.bash_profile ~/.hgrc \
      ~/.gitconfig ~/.tmux.conf ~/.Xmodmap
    mv ~/.ssh/config ~/.ssh/config.orig
    ln -s ~/dotfiles/.vimrc
    ln -s ~/dotfiles/.bashrc
    ln -s ~/dotfiles/.zshrc
    ln -s ~/dotfiles/.profile
    ln -s ~/dotfiles/.bash_profile
    ln -s ~/dotfiles/.hgrc
    ln -s ~/dotfiles/.gitconfig
    ln -s ~/dotfiles/.tmux.conf
    ln -s ~/dotfiles/.Xmodmap
    ln -s ~/dotfiles/sshconfig ~/.ssh/config
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim

Refresh your login session to pick up all the dotfile updates, then run:

    neobundle-update
    neobundle-clean

## `st` notes

For running `st` under KDE:

    kstart --maximize --windowclass "st-256color" st -e tmux attach
