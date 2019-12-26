# My Dotfiles

Clone to `~/dotfiles`

## Requirements & Assumptions

Some of these will be installed via the install scripts or apt-get below.

* Root access via `sudo`
* Z-shell, `zsh` is available and set as a shell, via `chsh`
* [Git][] for source control

### For Ubuntu flavors (I'm looking at you, 18.04):

    sudo -v
    sudo apt update
    sudo apt install -y python-dev python3-dev curl software-properties-common git
    curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
    python2 /tmp/get-pip.py --user
    python3 /tmp/get-pip.py --user
    git clone https://github.com/darcmattr/dotfiles ~/dotfiles
    curl -sL https://deb.nodesource.com/setup_13.x | \
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
    sudo add-apt-repository 'deb http://apt.llvm.org/eoan/ llvm-toolchain-oean-9 main'
    sudo add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main'
    sudo add-apt-repository 'deb http://nginx.org/packages/mainline/ubuntu/ eoan nginx'
    sudo apt update
    sudo apt install autossh bison build-essential clang-9 clang-9-doc \
      clang-format-9 clang-tools-9 clangd-9 cmake flex git golang-go htop \
      libc++-9-dev libc++abi-9-dev libclang-9-dev libclang-common-9-dev \
      libclang1-9 libevent-dev libfuzzer-9-dev libgit2-dev libllvm-9-ocaml-dev \
      libllvm9 liblzma-dev libncurses5-dev libnss3-tools libomp-9-dev \
      libpcre3-dev libssh2-1-dev libssl-dev lld-9 lldb-9 llvm-9 llvm-9-dev \
      llvm-9-doc llvm-9-examples llvm-9-runtime neovim nginx nodejs php-common \
      php-gd php-imagick php-mbstring php-memcache php-pear php-xdebug php-xml \
      php-zip php7.3-cli php7.3-curl php7.3-dev php7.3-fpm php7.3-imap \
      php7.3-json php7.3-mysql php7.3-opcache php7.3-readline php7.3-soap \
      postgresql-11 pv python-clang-9 python3-docutils ruby-dev shellcheck tidy \
      vim-nox wslu xcape xsel yarn zlib1g-dev zsh

# LLVM

The `helpers/debianish-update-alternatives.sh` will make LLVM and Go usable on
Ubuntu.

## Installation Steps

### for prezto

    cd ~
    git clone --recursive https://github.com/sorin-ionescu/prezto.git \
      "${ZDOTDIR:-$HOME}/.zprezto"
    ln -s "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/external/async/async.zsh" \
      "${HOME}/.zfunc/async"

### All the rest

Refresh the session, then run the following:

    ~/dotfiles/init.sh

I have transitioned to using NeoVim, but still keep Vim around with its own
configuration file, because vimpager.

### `.hgrc`

    [hooks]
    update="chmod 600 ~/dotfiles/sshconfig"

## Experimental notes

### Kotlin

Experimenting with Kotlin now, it requires a Java compiler and the `sdk` script
to be installed first:
  
  curl -s https://get.sdkman.io | bash
  
Reload shell session, then:

  sdk install kotlin

Which installs the `kotlinc` compiler and `kotlinc-jvm` REPL utility.

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

    %LOCALAPPDATA%\wsltty\bin\mintty.exe --WSL= --configdir="%APPDATA%\wsltty" -~ -B thin

#### Shortcut for Alacritty

If alacritty is installed on the WSL side, create a new shortcut and set its
target to:

    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "Start-Process -FilePath "C:\Windows\System32\bash.exe" -ArgumentList '-c','''cd $HOME; DISPLAY=localhost:0.0 alacritty''' -WindowStyle Hidden"

#### Configure CAPSLOCK

Manually install `https://github.com/ililim/dual-key-remap` in order to get the
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
