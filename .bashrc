# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

ulimit -c 0
set -o vi
umask 002
#newgrp apache

declare -x CVS_RSH='ssh'
declare -x LS_COLORS='no=01;37:fi=01;37:di=01;34:ln=01;36:pi=01;32:so=01;35:do=01;35:bd=01;33:cd=01;33:ex=01;31:mi=00;05;37:or=00;05;37:'
declare -x PAGER='less'
declare -x EDITOR='vim'
declare -x VISUAL="${EDITOR}"
declare -x LESS="-EXMRQ"
declare -x CVSROOT="darceneaux@demo.aynrand.org:/var/www/cvs"
declare -x WEB_ENVIRONMENT='live'
declare -x MANWIDTH=80

# --group-directories-first requires a recent version of coreutils
function ll  { ls --color=auto --group-directories-first --sort=extension -FAqlh $@; }
function dir { ls --color=always --group-directories-first --sort=extension -FAqlh $@ | less; }
function clearcache {
  yes y | rm /tmp/cache/{0,1,2,3}*.cache;
  yes y | rm /tmp/cache/{4,5,6,7}*.cache;
  yes y | rm /tmp/cache/{8,9,a,b}*.cache;
  yes y | rm /tmp/cache/{c,d,e,f}*.cache;
}
function clearmodps {
  sudo /etc/init.d/httpd graceful
  sudo mv /var/www/mod_pagespeed/cache /var/www/mod_pagespeed/cache.old
  sudo /etc/init.d/httpd start
  sudo rm -rf  /var/www/mod_pagespeed/cache.old
}
# delete grep cache
function dgc {
  rm -rf $(grep -l '<!-- http://aynrandlexicon.com/lexicon/quote_of_the_day.html' /var/www/libraries/cache/*.cache); curl -I -s http://aynrandlexicon.com/lexicon/quote_of_the_day.html > /dev/null
}
function tarlm {
  if [ ! -f $1.access.$2.tgz ]
  then
    sudo tar -zvcf $1.access.$2.tgz $1.access.$2*.log && sudo rm $1.access.$2*.log;
  fi
  if [ ! -f $1.error.$2.tgz ]
  then
    sudo tar -zvcf $1.error.$2.tgz $1.error.$2*.log && sudo rm $1.error.$2*.log;
  fi
}

##############################
# ##### PROMPT SECTION ##### #
##############################

#unset PROMPT_COMMAND

# color_name='\[\033[ color_code m\]'

rgb_restore='\[\033[00m\]'
rgb_black='\[\033[00;30m\]'
rgb_firebrick='\[\033[00;31m\]'
rgb_red='\[\033[01;31m\]'
rgb_forest='\[\033[00;32m\]'
rgb_green='\[\033[01;32m\]'
rgb_brown='\[\033[00;33m\]'
rgb_yellow='\[\033[01;33m\]'
rgb_navy='\[\033[00;34m\]'
rgb_blue='\[\033[01;34m\]'
rgb_purple='\[\033[00;35m\]'
rgb_magenta='\[\033[01;35m\]'
rgb_cadet='\[\033[00;36m\]'
rgb_cyan='\[\033[01;36m\]'
rgb_gray='\[\033[00;37m\]'
rgb_white='\[\033[01;37m\]'

rgb_std="${rgb_white}"

if [ `id -u` -eq 0 ]
then
  rgb_usr="${rgb_red}"
else
  rgb_usr="${rgb_yellow}"
fi

#function prompt_command { newPWD="${PWD}"; }
#PROMPT_COMMAND=prompt_command

#[ -n "$PS1" ] && PS1="${rgb_usr}[\t]${rgb_std}\n${newPWD}${rgb_usr}\$${rgb_restore} "
[ -n "$PS1" ] && PS1="\n${rgb_usr}[\t]${rgb_std}\n\$(pwd)${rgb_usr}\n\$${rgb_restore} "

unset   rgb_restore   \
        rgb_black     \
        rgb_firebrick \
        rgb_red       \
        rgb_forest    \
        rgb_green     \
        rgb_brown     \
        rgb_yellow    \
        rgb_navy      \
        rgb_blue      \
        rgb_purple    \
        rgb_magenta   \
        rgb_cadet     \
        rgb_cyan      \
        rgb_gray      \
        rgb_white     \
        rgb_std       \
        rgb_usr
