if [ -x /usr/bin/vim ]; then
  EDITOR=/usr/bin/vim
elif [ -x /usr/local/bin/vim ]; then
  EDITOR=/usr/local/bin/vim
else
  EDITOR=/usr/bin/vi
fi

if [ -x /usr/bin/less ]; then
  export PAGER=/usr/bin/less
else
  export PAGER=less
fi

export PATH=.:$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games:$HOME/.rvm/bin
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export LC_CTYPE=en_US.UTF-8
export HGEDITOR=~/dotfiles/hgeditor
export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET=utf-8
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export MANWIDTH=80
export HOME EDITOR

if [ -x /usr/local/bin/vimpager ]; then
  export MANPAGER=/usr/local/bin/vimpager
fi

if [[ -f /usr/bin/uname && `/usr/bin/uname` == OpenBSD ]]; then
  export PKG_PATH=http://ftp5.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`/
  export CVSROOT=/var/www/cvs
fi

if [ -r ~/.profile.local ]; then
  source ~/.profile.local
fi
