# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

Some of these will be installed via the install scripts or apt-get below.

* Root access via `sudo`
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Mercurial SCM][], `hg`, and [Git][], `git`, source control programs

### For Ubuntu flavors (I'm looking at you, 18.04):

    sudo -v
    sudo apt update
    sudo apt install -y python-dev python3-dev curl software-properties-common
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    python2 /tmp/get-pip.py --user
    python3 /tmp/get-pip.py --user
    ~/.local/bin/pip2 install -U --user mercurial
    ~/.local/bin/hg clone https://bitbucket.org/darceneaux/dotfiles
    curl -sL https://deb.nodesource.com/setup_10.x | \
      sudo -E bash - # argh, I hate this
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
      sudo tee /etc/apt/sources.list.d/yarn.list
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo add-apt-repository -y ppa:ondrej/php
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo add-apt-repository -y ppa:git-core/ppa
    wget --quiet -O - "http://apt.llvm.org/llvm-snapshot.gpg.key" | \
      sudo apt-key add -
    wget --quiet -O - "http://nginx.org/keys/nginx_signing.key" | \
      sudo apt-key add -
    wget --quiet -O - "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | \
      sudo apt-key add -
    sudo add-apt-repository 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-6.0 main'
    sudo add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main'
    sudo add-apt-repository 'deb http://nginx.org/packages/mainline/ubuntu/ bionic nginx'
    sudo apt update
    sudo apt install autossh build-essential clang-6.0 clang-6.0-doc \
      clang-format-6.0 clang-tools-6.0 cmake git golang-go htop libclang1-6.0 \
      libclang1-6.0-dbg libclang-6.0-dev libclang-common-6.0-dev libevent-dev \
      libfuzzer-6.0-dev libgit2-dev liblldb-6.0-dev libllvm6.0 libllvm6.0-dbg \
      liblzma-dev libncurses5-dev libpcre3-dev libssh2-1-dev libssl-dev lld-6.0 \
      lldb-6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-doc llvm-6.0-examples \
      llvm-6.0-runtime neovim nginx nodejs php7.2-cli php7.2-curl php7.2-dev \
      php7.2-fpm php7.2-imap php7.2-json php7.2-mysql php7.2-opcache \
      php7.2-readline php7.2-soap php-common php-gd php-imagick php-mbstring \
      php-memcache php-pear php-xdebug php-xml php-zip postgresql-10 pv \
      python3-docutils python-clang-6.0 ruby-dev shellcheck tidy vim-nox xsel \
      yarn zlib1g-dev zsh zsh-lovers
    go get -u github.com/junegunn/fzf
    go get -u github.com/sourcegraph/go-langserver

The `helpers/debianish-update-alternatives.sh` will make LLVM and Go usable on
Ubuntu.

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

### WSL stuffs

Install [wslu](https://github.com/wslutilities/wslu) for its `wslview` utility.

#### Shortcut for VcXsrv

Save the configuration after first run, and an example of how to have it load up
on subsequent restarts is to create a Windows shortcut of:

    vcxsrv.exe :0 -ac -terminate -lesspointer -multiwindow -clipboard -nowgl

To make this load automatically at boot, run `shell:startup` via Win-R and copy
the above shortcut into the startup folder.

#### Shortcut for wsltty

While I track my wsltty configuration in source control, an example of the
shortcut for wsltty is:

`%LOCALAPPDATA%\wsltty\bin\mintty.exe --WSL= --configdir="%APPDATA%\wsltty" -~ -B thin

The `-B` is for borderless, and until wslbridge gets fixed, I still need to pass
in the login shell path, hence the `/usr/bin/zsh`.


### Self-signed certificates

Every dev machine should have its own Certificate Authority certificate to sign
its own certs, so the CA can be accepted, allowing all the local certs generated
with it to pass through without challenge. To do so:

    mkdir -p "${HOME}/.config/ssl"
    openssl genrsa -out "$HOME/.config/ssl/rootCA.key" 2048
    sudo openssl req -x509 -new -nodes -days 3563 -sha256 \
      -subj "/CN=localhost/O=DavidTheMachine/C=US/ST=California/L=Anaheim" \
      -key "${HOME}/.config/ssl/rootCA.key" \
      -out "/usr/share/ca-certificates/localhost-rootCA.pem"
    sudo openssl x509 -in "/usr/share/ca-certificates/localhost-rootCA.pem" \
      -out "/usr/share/ca-certificates/localhost-rootCA.crt" -inform PEM
    sudo dpkg-reconfigure ca-certificates

### Keyboard Mapping Under GNOME/Wayland

I'm trying GNOME-under-Wayland now, which means the `.Xmodmap` file does nothing
anymore, so the alternative as I see it is to edit system files to get what
I had before. The `speshul` file has my interventions, there, and I had to copy
it to `/usr/share/X11/xkb/symbols/speshul`, append

    speshul:speshul = +speshul(speshul)

to the

    ! option = symbols

section in the file `/usr/share/X11/xkb/rules/evdev`, and append

    speshul:speshul      Caps -> Ctrl, Ctrl -> Esc, Esc -> Caps

to the end of `/usr/share/X11/xkb/symbols/evdev.lst`, then using `dconf editor`,
I had to add `'speshul:speshul'` to the **Custom value** field array to
`/org/gnome/desktop/input-sources/xkb-options`. (ugh).

[Mercurial SCM]: http://mercurial.selenic.com
[Git]: http://git-scm.com
