# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

Some of these will be installed via the install scripts or apt-get below.

* Root access via `sudo`
* Python's `pip` and `pip3` are available
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Mercurial SCM][], `hg`, and [Git][], `git`, source control programs

### For Ubuntu flavors (I'm looking at you, 16.04):

    sudo -v
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - # argh, I hate this
    sudo apt-get update
    sudo apt-get install -y curl git python-dev cmake python3-dev python-pip \
      python3-pip zsh zsh-lovers autossh tmux pv xsel s3cmd nodejs \
      build-essential software-properties-common nodejs golang
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo add-apt-repository -y ppa:ondrej/php
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu xenial main'
    sudo apt-get update
    sudo apt-get install -y neovim mariadb-server php-common php-imagick \
      php-memcache php-pear php-xml php7.1-cli php7.1-common php7.1-curl \
      php7.1-dev php7.1-fpm php7.1-gd php7.1-imap php7.1-json php7.1-mbstring \
      php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-readline php7.1-soap \
      php7.1-xml vim-nox
    sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
    sudo npm -g install gulp eslint eslint_d js-beautify cssbeautify \
      minify node-sass tern grunt

## Installation Steps

### for prezto

    cd ~
    git clone --recursive https://github.com/sorin-ionescu/prezto.git \
      "${ZDOTDIR:-$HOME}/.zprezto"

### All the rest

Refresh the session, then run the following:

    ~/dotfiles/init.sh

I have transitioned to using NeoVim, but still keep Vim around with its own
configuration file, because vimpager.

## Experimental notes

### `st`

For running `st` under KDE:

    kstart --maximize --windowclass "st-256color" st -e tmux attach

[Mercurial SCM]: http://mercurial.selenic.com
[Git]: http://git-scm.com

