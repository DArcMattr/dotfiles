# My Dotfiles

## Requirements & Assumptions

Some of these will be installed via the install scripts or `apt` below.

* Root access via `sudo`
* The variables `$XDG_CONFIG_HOME`, `$XDG_CACHE_HOME`, `$XDG_DATA_HOME` are
    defined in the machine's global environment variables, and corresponding
    user directories are created for them

### For Ubuntu flavors

```sh
REL="$(lsb_release -cs)"
sudo -v
sudo apt update
sudo apt install -y curl software-properties-common
sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:ondrej/php
curl -sS "https://apt.llvm.org/llvm-snapshot.gpg.key" | \
  sudo tee /etc/apt/trusted.gpg.d/llvm.asc
curl -sS "http://nginx.org/keys/nginx_signing.key" | \
  sudo tee /etc/apt/trusted.gpg.d/nginx.asc
curl -fsSL "http://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key" | \
  sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg 
sudo add-apt-repository \
  "deb https://deb.nodesource.com/node_22.x nodistro main"
curl -sS "https://packages.microsoft.com/keys/microsoft.asc" | \
  sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo add-apt-repository \
  "deb http://nginx.org/packages/mainline/ubuntu ${REL} nginx"
sudo add-apt-repository \
  "deb http://apt.llvm.org/${REL}/ llvm-toolchain-${REL}-17 main"
sudo add-apt-repository \
    "$(wget -qO- https://packages.microsoft.com/config/ubuntu/22.04/prod.list)" # XXX
sudo apt install autossh bison build-essential clang-17 clang-17-doc \
  clang-format-17 clang-tidy-17 clang-tools-17 clangd-17 cmake fd-find flex \
  fswatch git git-extras golang htop jq libc++-17-dev-wasm32 \
  libc++abi-17-dev-wasm32 libclang-17-dev libclang-common-17-dev \
  libclang-rt-17-dev libclang-rt-17-dev-wasm32 libclang-rt-17-dev-wasm32 \
  libclang-rt-17-dev-wasm64 libclang-rt-17-dev-wasm64 libclang1-17 \
  libevent-dev libfuzzer-17-dev libgit2-dev libjansson-dev \
  libllvm-17-ocaml-dev libllvm16 liblua5.3-dev liblzma-dev libncurses5-dev \
  libnss3-tools libomp-17-dev libpcre3-dev libsqlite3-dev libssh2-1-dev \
  libssl-dev libxml2-dev libyaml-dev lld-17 lldb-17 llvm-17 llvm-17-dev \
  llvm-17-doc llvm-17-examples llvm-17-runtime lsyncd neovim nginx nodejs \
  php-common php-gd php-imagick php-mbstring php-memcache php-pear php-xdebug \
  php-xml php-zip php8.3-cli php8.3-curl php8.3-dev php8.3-fpm php8.3-imap \
  php8.3-mysql php8.3-opcache php8.3-readline php8.3-soap php8.3-sqlite3 \
  php8.3-xml pv python-is-python3 python3-clang-17 python3-dev ruby-dev \
  shellcheck sqlcmd tidy wget wslu xcape xsel zlib1g-dev zsh

git clone https://github.com/darcmattr/dotfiles ~/dotfiles
sh ~/dotfiles/helpers/debianish-update-alternatives.sh
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python /tmp/get-pip.py --user --break-system-packages
chsh -s $(which zsh)
sudo corepack enable
sudo corepack prepare pnpm@latest --activate
```

Refresh the shell session, then run the following:

```sh
sh ~/dotfiles/init.sh
```

## Experimental notes

### Kotlin

Experimenting with Kotlin now, it requires a Java compiler and the `sdk` script
to be installed first:

```sh
curl -s https://get.sdkman.io | bash
```

Reload shell session, then:

    sdk install kotlin

Which installs the `kotlinc` compiler and `kotlinc-jvm` REPL utility.

### WSL/Windows stuffs

#### Powershell on Windows

Install Chocolatey and activate winget [TODO]

Install current Powershell v7 through Windows Store

Contents of `$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`, can edit it by `notepad $PROFILE`.

```powershell
oh-my-posh init pwsh --config $env:LOCALAPPDATA\Programs\oh-my-posh\themes\atomicBit.omp.json | Invoke-Expression
Enable-PoshTooltips
if ($host.Name -eq 'ConsoleHost') {
  Import-Module PSReadline 
  Set-PSReadlineOption -EditMode vi -BellStyle None
}
```
Once the profile is set up, run the following commands in a Powershell prompt:

```powershell
winget install JanDeDobbeleer.OhMyPosh
Get-PoshThemes
Install-Module PSReadline
. $PROFILE
```

Update by `Update-Module` for PSReadline, and
`winget upgrade JanDeDobbeleer.OhMyPosh`

#### fvim.exe cmd shortcut

Assumes FVim installed through Chocolatey.

Make file named `fvim.cmd`:

```cmd
@echo off
wsl /mnt/c/tools/fvim/fvim.exe --wsl "$(wslpath %1)" &
```

#### Configure CAPSLOCK

Manually install https://github.com/ililim/dual-key-remap in order to get the
same "tap CAPSLOCK for Escape, press for Control" behavior that exists in the
Unix-like configuration. Use [Winaero Tweaker](https://winaerotweaker.com) to
make an "Elevated Shortcut" for the program and place it in the Startup folder
so the remapping can work in Admin mode shells. 

In Unix-like environments `xcape` provides that functionality.

### Self-signed certificates

Once Golang is installed, `mkcert` will also be. Run `mkcert -install`. If
running it in WSL, I found it's best to generate the certificate pairs on the
WSL side, and to copy the generated root file to the Windows-side directory, and
run `mkcert -install` there.

### MySQL safe password storage

The utility `mysql_config_editor` is essential to keeping plaintext passwords
out of local configuration files.

An example

```sh
mysql_config_editor set --login-path=local --host=127.0.0.1 --user=db_user --password
```

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
