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
    sudo apt update
    sudo apt install -y python-pip python-dev curl software-properties-common
    pip install -U --user mercurial
    ~/.local/bin/hg clone https://bitbucket.org/darceneaux/dotfiles
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - # argh, I hate this
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo add-apt-repository -y ppa:ondrej/php
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
    sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu xenial main'
    sudo add-apt-repository 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 xenial main'
    sudo apt update
    sudo apt install autossh build-essential clang-4.0 clang-4.0-doc \
      clang-format-4.0 cmake git golang htop libboost-filesystem-dev \
      libboost-python-dev libboost-regex-dev libboost-system-dev libclang1-4.0 \
      libclang1-4.0-dbg libclang-4.0-dev libclang-common-4.0-dev libevent-dev \
      libfuzzer-4.0-dev libllvm4.0 libllvm4.0-dbg libllvm-4.0-ocaml-dev \
      liblzma-dev libncurses5-dev libpcre3-dev lld-4.0 lldb-4.0 liblldb-4.0-dev \
      llvm-4.0 llvm-4.0-dev llvm-4.0-doc llvm-4.0-examples llvm-4.0-runtime \
      mariadb-server neovim nodejs nodejs php7.1-cli php7.1-common php7.1-curl \
      php7.1-dev php7.1-fpm php7.1-gd php7.1-imap php7.1-json php7.1-mbstring \
      php7.1-mcrypt php7.1-mysql php7.1-opcache php7.1-readline php7.1-soap \
      php7.1-xml php-common php-imagick php-memcache php-pear php-xml pv \
      python3-dev python3-pip python-clang-4.0 ruby-dev s3cmd vim-nox xsel \
      zlib1g-dev zsh zsh-lovers
    sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-4.0 10
    sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-4.0 10
    sudo update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-4.0 10
    sudo npm -g install gulp eslint eslint_d js-beautify cssbeautify minify \
      node-sass tern grunt

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

### `.hgrc`

    [hooks]
    update="chmod 600 ~/dotfiles/sshconfig"

## Experimental notes

### `st`

For running `st` under KDE:

    kstart --maximize --windowclass "st-256color" st -e tmux attach

[Mercurial SCM]: http://mercurial.selenic.com
[Git]: http://git-scm.com

