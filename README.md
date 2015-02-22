# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

* Root access via `sudo`
* Vim with the Python 2.7 engine compiled in
* Python's `pip` is available, with all the necessary permissions to run it
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Mercurial SCM][], `hg`, and [Git][], `git`, source control programs

## Installation Steps

### for zprezto

Copy/paste the following onto the command line:

    cd ~
    git clone --recursive https://github.com/sorin-ionescu/prezto.git \
      "${ZDOTDIR:-$HOME}/.zprezto"

### All the rest

Refresh the session, then run the following:

    ~/dotfiles/init.sh
    ln -s ~/dotfiles/.vimrc ~/.nvimrc
    mv ~/.ssh/config ~/.ssh/config.orig
    ln -s ~/dotfiles/sshconfig ~/.ssh/config
    ln -s ~/dotfiles/hgcommit.vim ~/.vim/syntax/hgcommit.vim

I have transitioned to using NeoVim as a full replacement for Vim, and will
transition my configs to use nvim directly. In the meantime, I will place
a symlink for `vim` -> `nvim` where ever I can put it, either in
`/usr/local/bin`, or `~/bin`

## Experimental notes

### `st`

For running `st` under KDE:

    kstart --maximize --windowclass "st-256color" st -e tmux attach

[Mercurial SCM]: http://mercurial.selenic.com
[Git]: http://git-scm.com
