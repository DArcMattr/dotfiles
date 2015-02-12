# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

* Root access via `sudo`
* Vim with the Python 2.7 engine compiled in
* Python's `pip` is available, with all the necessary permissions to run it
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Mercurial SCM][], `hg`, and [Git][], `git`, source control programs

## Installation Steps

### for Oh-My-ZSH

Copy/paste the following onto the command line:

    cd ~
    curl -L \
      https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh \
      | sh

### All the rest

Refresh the session, then run the following:

    ~/dotfiles/init.sh
    rm ~/.vimrc ~/.bashrc ~/.zshrc ~/.profile ~/.bash_profile ~/.hgrc \
      ~/.gitconfig ~/.tmux.conf ~/.Xmodmap ~/.pandoc
    mv ~/.ssh/config ~/.ssh/config.orig
    ln -s ~/dotfiles/.vimrc
    ln -s ~/dotfiles/.vimrc ~/.nvimrc
    ln -s ~/dotfiles/.bashrc
    ln -s ~/dotfiles/.pandoc
    ln -s ~/dotfiles/.zshenv
    ln -s ~/dotfiles/.zshrc
    ln -s ~/dotfiles/.profile
    ln -s ~/dotfiles/.bash_profile
    ln -s ~/dotfiles/.hgrc
    ln -s ~/dotfiles/.gitconfig
    ln -s ~/dotfiles/.tmux.conf
    ln -s ~/dotfiles/.Xmodmap
    ln -s ~/dotfiles/sshconfig ~/.ssh/config
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim

## Experimental notes

### `st`

For running `st` under KDE:

    kstart --maximize --windowclass "st-256color" st -e tmux attach

[Mercurial SCM]: http://mercurial.selenic.com
[Git]: http://git-scm.com
