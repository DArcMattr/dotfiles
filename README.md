# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

Some of these will be installed via the install scripts or apt-get below.

* Root access via `sudo`
* The variables `$XDG_CONFIG_HOME`, `$XDG_CACHE_HOME`, `$XDG_DATA_HOME` are
    defined in the machine's global environment variables, and corresponding
    user directories are created for them

### For Ubuntu flavors

    REL="$(lsb_release -cs)"
    sudo -v
    sudo apt update
    sudo apt install -y curl software-properties-common wget
    sudo add-apt-repository -y universe
    sudo add-apt-repository -y multiverse
    curl -sL https://deb.nodesource.com/setup_14.x | \
      sudo -E bash - # argh, I hate this
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
      sudo tee /etc/apt/sources.list.d/yarn.list
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo add-apt-repository -y ppa:longsleep/golang-backports
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo add-apt-repository -y ppa:ondrej/php
    wget --quiet -O - "http://apt.llvm.org/llvm-snapshot.gpg.key" | \
      sudo apt-key add -
    sudo add-apt-repository \
      "deb http://apt.llvm.org/${REL}/ llvm-toolchain-${REL}-10 main"
    wget --quiet -O - "http://nginx.org/keys/nginx_signing.key" | \
      sudo apt-key add -
    sudo add-apt-repository \
      "deb http://nginx.org/packages/mainline/ubuntu ${REL} nginx"
    sudo apt install autossh bison build-essential clang-10 clang-10-doc \
      clang-format-10 clang-tools-10 clangd-10 cmake cpanminus flex git \
      golang-go htop libc++-10-dev libc++abi-10-dev libclang-10-dev \
      libclang-common-10-dev libclang1-10 libevent-dev libfuzzer-10-dev \
      libgit2-dev libjansson-dev libllvm-10-ocaml-dev libllvm9 liblzma-dev \
      libncurses5-dev libnss3-tools libomp-10-dev libpcre3-dev libssh2-1-dev \
      libsqlite3-dev libssl-dev libxml2-dev libyaml-dev lsyncd lld-10 lldb-10 \
      llvm-10 llvm-10-dev llvm-10-doc llvm-10-examples llvm-10-runtime neovim \
      nginx nodejs php-common php-gd php-imagick php-mbstring php-memcache \
      php-pear php-xdebug php-xml php-zip php7.4-cli php7.4-curl php7.4-dev \
      php7.4-fpm php7.4-imap php7.4-json php7.4-mysql php7.4-opcache \
      php7.4-readline php7.4-soap pv python-dev python3-dev python3-docutils \
      ruby-dev shellcheck tidy wslu xcape xsel yarn zlib1g-dev zsh
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    python2 /tmp/get-pip.py --user
    python3 /tmp/get-pip.py --user
    git clone https://github.com/darcmattr/dotfiles ~/dotfiles

# LLVM

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

## Experimental notes

### Kotlin

Experimenting with Kotlin now, it requires a Java compiler and the `sdk` script
to be installed first:

  curl -s https://get.sdkman.io | bash

Reload shell session, then:

  sdk install kotlin

Which installs the `kotlinc` compiler and `kotlinc-jvm` REPL utility.

### WSL/Windows stuffs

#### Configure CAPSLOCK

Manually install (`https://github.com/ililim/dual-key-remap`)[] in order to get the
same "tap CAPSLOCK for Escape, press for Control" behavior that exists in the
Unix-like configuration.

### Self-signed certificates

Once Golang is installed, `mkcert` will also be. Run `mkcert -install`. If
running it in WSL, I found it's best to generate the certificate pairs on the
WSL side, and to copy the generated root file to the Windows-side directory, and
run `mkcert -install` there.

### Keyboard Mapping Under GNOME/Wayland

I tried GNOME-under-Wayland, which means the `.Xmodmap` file does nothing
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

[Git]: http://git-scm.com
