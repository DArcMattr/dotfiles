# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

if [ -r /etc/ksh.kshrc ]; then
  . /etc/ksh.kshrc
fi

export HOME TERM
export PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PS1='\n[\e[41;33m\t\e[0m]\n${PWD}\n\$ '
export CLICOLOR_FORCE=YES
export PAGER=/usr/bin/less
export EDITOR=/usr/local/bin/vim
export HGEDITOR=~/dotfiles/hgeditor
export LESS="-EXMrQ"
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export PKG_PATH=http://ftp5.usa.openbsd.org/pub/OpenBSD/`uname -r`/packages/`machine -a`/
export CVSROOT=/var/www/cvs

if [ -x /usr/games/fortune ]; then
  echo "\n$(/usr/games/fortune -a)"
fi

set -o vi
#umask 007

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
  if [ -x /usr/local/bin/colorls ]; then
    /usr/local/bin/colorls -GAalFh $@ | \
      egrep "^d" \
    &&
    /usr/local/bin/colorls -GAalFh $@ | \
      egrep -v "^d|total" \
    &&
    /usr/local/bin/colorls -lk | \
      egrep "total"
  else
    /bin/ls -AalFh $@
  fi | \
  /usr/bin/less;
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

alias rm='movetrash'
alias key='man -k'
alias info='info --vi-keys'
alias ssh_web="ssh darceneaux@10.10.10.10 -t 'tmux attach || tmux new'"
alias cycapache='/usr/bin/sudo /usr/bin/pkill -SIGQUIT -U www; /bin/sleep 2; /usr/bin/sudo /usr/sbin/apachectl start'
alias forethought='ssh ari@216.241.32.130'
#alias updb='mysql <SQL/page.sql> /dev/null && mysql <SQL/page_content.sql> /dev/null'
