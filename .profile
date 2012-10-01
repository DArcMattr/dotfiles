# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

if [ -r /etc/ksh.kshrc ]; then
  . /etc/ksh.kshrc
fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [[ $TERM == xterm || $TERM == screen ]]; then
  TERM="xterm-256color";
else
  TERM="wsvt25";
fi
COLORTERM=

if [ `uname` == OpenBSD ]; then
  PKG_PATH=http://ftp5.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`/
else
  PKG_PATH=
fi

if [ -x /usr/bin/vim ]; then
  EDITOR=/usr/bin/vim
else
  EDITOR=/usr/local/bin/vim
fi

export HOME TERM COLORTERM EDITOR PKG_PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games:.
export PS1='\n[\e[41;33m\t\e[0m]\n${PWD}\n\$ '
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export PAGER=/usr/bin/less
export HGEDITOR=~/dotfiles/hgeditor
export LESS="-EXMRQ"
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export CVSROOT=/var/www/cvs

if [ -x /usr/games/fortune ]; then
  echo "\n$(/usr/games/fortune -a)"
fi

# This is for tmux
[ -n "$TMUX" ] && export TERM="screen-256color"

set -o vi
#umask 007

alias rm='movetrash'
alias key='man -k'
alias info='info --vi-keys'
alias ssh_web="ssh darceneaux@10.10.10.10 -t 'tmux attach || tmux new'"
alias cycapache='/usr/bin/sudo /usr/bin/pkill -SIGQUIT -U www; /bin/sleep 2; /usr/bin/sudo /usr/sbin/apachectl start'
alias forethought='ssh ari@216.241.32.130'

#alias updb='mysql <SQL/page.sql> /dev/null && mysql <SQL/page_content.sql> /dev/null'
if [ -x /usr/local/bin/colorls ]; then
  alias ls='colorls'
fi

movetrash() {
  mv $* ~/.trash;
}

playtime() {
  if [ -x /usr/local/bin/ffmpeg ]; then
    ffmpeg -i $@ 2>&1|sed -n "s/.*Duration: \([^,]*\).*/\1/p"
  else
    echo "ffmpeg is not installed"
  fi
}

dir() {
  {
    ls -AalFh $* | egrep "^d" \
  &&
    ls -AalFh $* | egrep -v "^d|total" \
  &&
    ls -lk $* | egrep "total"
  } | /usr/bin/less;
}

tree() {
  echo -e "\033[1;33m"

  (cd ${1-.}; pwd)
  find ${1-.} -print | sort -f | sed  \
    \
    -e "s,^${1-.},,"                  \
    -e "/^$/d"                        \
    -e "s,[^/]*/\([^/]*\)$,\ |-->\1," \
    -e "s,[^/]*/, |   ,g"
  echo -e "\033[0m"
}

path() {
  echo $PATH | tr ':' '\n'
}

manpath() {
  echo $MANPATH | tr ':' '\n'
}

sshmac() {
  ssh mac -t '/usr/local/bin/tmux attach || /usr/local/bin/tmux new'
}
