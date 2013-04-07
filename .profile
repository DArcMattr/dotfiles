# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#

if [[ $TERM == xterm || $TERM == screen ]]; then
  TERM="xterm-256color";
else
  TERM="wsvt25";
fi

if [ -x /usr/bin/vim ]; then
  EDITOR=/usr/bin/vim
elif [ -x /usr/local/bin/vim ]; then
  EDITOR=/usr/local/bin/vim
else
  EDITOR=/usr/bin/vi
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games:.
#export PS1='\n[\e[41;33m\t\e[0m]\n${PWD}\n\$ '
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export LC_CTYPE=en_US.UTF-8
export HGEDITOR=~/dotfiles/hgeditor
export PAGER=less
export LESS="-EFXMRQcs~"
export LESSCHARSET=utf-8
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CVSROOT=/var/www/cvs
export HOME TERM EDITOR PAGER

if [[ -f /usr/bin/uname && `/usr/bin/uname` == OpenBSD ]]; then
  export PKG_PATH=http://ftp5.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`/
fi

if [ -x /usr/bin/less ]; then
  export PAGER=/usr/bin/less
fi

if [ -x /usr/games/fortune ]; then
  echo "\n$(/usr/games/fortune -a)"
elif [ -x /usr/bin/fortune ]; then
  echo "\n$(/usr/bin/fortune -a)"
fi

# This is for tmux
[ -n "$TMUX" ] && export TERM="screen-256color"

set -o vi
umask 007

#alias updb='mysql <SQL/page.sql> /dev/null && mysql <SQL/page_content.sql> /dev/null'

#dir() {
#  {
#    if [ -x /usr/local/bin/colorls ]; then
##      foo = `colorls -AalFh "$@"`
#        colorls -AalFh "$@" | egrep "^d" \
#      &&
#        colorls -AalFh "$@" | egrep -v "^d|total" \
#      &&
#        colorls -lk "$@" | egrep "total"
#    else
#        ls -AalFh "$@" | egrep "^d" \
#      &&
#        ls -AalFh "$@" | egrep -v "^d|total" \
#      &&
#        ls -lk "$@" | egrep "total"
#    fi
#  } | $PAGER;
#}
