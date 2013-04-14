# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $

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

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games:.
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export LC_CTYPE=en_US.UTF-8
export HGEDITOR=~/dotfiles/hgeditor
export LESS="-EFMQRsX~"
export LESSCHARSET=utf-8
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export MANWIDTH=80
export HOME EDITOR

if [[ -f /usr/bin/uname && `/usr/bin/uname` == OpenBSD ]]; then
  export PKG_PATH=http://ftp5.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`/
  export CVSROOT=/var/www/cvs
fi
