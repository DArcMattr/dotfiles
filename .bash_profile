# .bash_profile
# called by .bashrc

tmux_self() {
  (export TERM=screen-256color-bce && tmux attach || tmux new)
}

ll() {
  ls --color=auto --group-directories-first --sort=extension -FAqlh "$@"
}

dir() {
  ls --color=auto --group-directories-first --sort=extension -FAqlh "$@" | less
}

clearcache() {
  rm -f /tmp/cache/{0,1,2,3}*.cache
  rm -f /tmp/cache/{4,5,6,7}*.cache
  rm -f /tmp/cache/{8,9,a,b}*.cache
  rm -f /tmp/cache/{c,d,e,f}*.cache
}

clearmodps() {
  sudo /sbin/apachectl stop
  sudo mv /var/www/mod_pagespeed/cache /var/www/mod_pagespeed/cache.old
  sudo /sbin/apachectl start
  sudo rm -rf /var/www/mod_pagespeed/cache.old
}

ssh_cor() {
  (export AUTOSSH_PORT=0 && autossh cor -t 'tmux attach || tmux new')
}

ssh_demo() {
  (export TERM=screen-256color-bce && export AUTOSSH_PORT=0 && autossh demo -t 'tmux attach || tmux new')
}

ssh_mc() {
  (export TERM=screen-256color-bce && export AUTOSSH_PORT=0 && autossh mc -t 'tmux attach || tmux new')
}

ssh_newdemo() {
  (export TERM=screen-256color-bce && export AUTOSSH_PORT=0 && autossh newdemo -t 'tmux attach || tmux new')
}

ssh_mac() {
  (export TERM=screen-256color-bce && export AUTOSSH_PORT=0 && autossh macthing -t '/usr/local/bin/tmux attach || /usr/local/bin/tmux new')
}

mountpub() {
  sudo mount -t cifs -o username=ARI/darceneaux,rw,file_mode=0666,dir_mode=0777 \\\\10.10.10.12\\Public /mnt/Public
}

mountfr() {
  sudo mount -t cifs -o username=ARI/darceneaux,rw,file_mode=0666,dir_mode=0777 \\\\10.10.10.12\\Fundraising /mnt/Fundraising
}

# delete grep cache, not sure how to generalize it
dgc() {
  rm -rf $(grep -l '<!-- http://aynrandlexicon.com/lexicon/quote_of_the_day.html' /var/www/libraries/cache/*.cache)
  curl -I -s http://aynrandlexicon.com/lexicon/quote_of_the_day.html > /dev/null
}

tarlm() {
  if [ ! -f $1.access.$2.tgz ]; then
    sudo tar -zvcf $1.access.$2.tgz $1.access.$2*.log && sudo rm $1.access.$2*.log
  fi
  if [ ! -f $1.error.$2.tgz ]; then
    sudo tar -zvcf $1.error.$2.tgz $1.error.$2*.log && sudo rm $1.error.$2*.log
  fi
}

hgdiff() {
  vimdiff -c 'map q :qa!<CR>' <(hg cat "$1") "$1"
}
