if [ -x /usr/local/bin/vim ]; then
  EDITOR=/usr/local/bin/vim
elif [ -x /usr/bin/vim ]; then
  EDITOR=/usr/bin/vim
else
  EDITOR=/usr/bin/vi
fi

if [ -x /usr/bin/less ]; then
  export PAGER=/usr/bin/less
else
  export PAGER=less
fi

export AUTOSSH_PORT=0
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export HGEDITOR=~/dotfiles/hgeditor
export HOME EDITOR
export LC_CTYPE=en_US.UTF-8
export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET=utf-8
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export MANWIDTH=80
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games:$HOME/.rvm/bin
export VIMRUNTIME=`vim -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `

if [ -x /usr/local/bin/vimpager ]; then
  export MANPAGER=/usr/local/bin/vimpager
fi

if [ -r ~/.profile.${HOST} ]; then
  source ~/.profile.${HOST}
fi
