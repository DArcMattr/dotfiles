# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

* Root access via `sudo`
* Vim with the Python 2.7 engine compiled in
* Python's `pip` is available, with all the necessary permissions to run it
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Mercurial SCM][], `hg`, and [Git][], `git`, source control programs

### For Ubuntu flavors:

    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install curl php5-fpm virtualbox git mercurial python-dev \
      python-pip clang zsh autossh neovim tmux mysql-client pv httpie \
      silversearcher-ag xsel s3cmd nodejs exuberant-ctags
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
    sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
    pip install --upgrade neovim # recent-ish Ubuntu does this non-overrideable personal pip directory stuffs
    sudo npm -g install gulp bower jshint js-beautify css-beautify minify

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
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
