# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

Some of these will be installed via the install scripts or apt-get below.

* Root access via `sudo`
* Python's `pip` is available, with all the necessary permissions to run it
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Mercurial SCM][], `hg`, and [Git][], `git`, source control programs

### For Ubuntu flavors (I'm looking at you, 14.04):

    sudo -v
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - # argh, I hate this
    sudo apt-get update
    sudo apt-get install -y curl git python-dev cmake python3-dev python-pip \
      python3-pip clang zsh autossh tmux pv xsel s3cmd nodejs silversearcher-ag \
      exuberant-ctags build-essential zsh-lovers software-properties-common \
      nodejs golang
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo add-apt-repository -y ppa:ondrej/php
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu xenial main'
    sudo apt-get update
    sudo apt-get install -y neovim mariadb-server php-common php-imagick \
      php-memcache php-pear php-xml php7.0-cli php7.0-common php7.0-curl \
      php7.0-dev php7.0-fpm php7.0-gd php7.0-imap php7.0-json php7.0-mbstring \
      php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-readline php7.0-soap \
      php7.0-xml vim-nox
    sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
    sudo npm -g install gulp bower eslint eslint_d js-beautify cssbeautify \
      minify node-sass tern grunt

## Installation Steps

### for oh-my-zsh

I had troubles with the prompts in zprezto, else I'd still be using it

    cd ~
    git clone --recursive https://github.com/robbyrussell/oh-my-zsh.git \
      ~/.oh-my-zsh

### All the rest

Refresh the session, then run the following:

    ~/dotfiles/init.sh

I have transitioned to using NeoVim, but still keep Vim around with its own
configuration file, because vimpager.

## Experimental notes

### `st`

For running `st` under KDE:

    kstart --maximize --windowclass "st-256color" st -e tmux attach

### for zprezto (old, might switch back)

Copy/paste the following onto the command line:

    cd ~
    git clone --recursive https://github.com/sorin-ionescu/prezto.git \
      "${ZDOTDIR:-$HOME}/.zprezto"

[Mercurial SCM]: http://mercurial.selenic.com
[Git]: http://git-scm.com

