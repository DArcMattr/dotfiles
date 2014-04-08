if type "vim" > /dev/null; then
  EDITOR=`which vim`
else
  EDITOR=`which vi`
fi
export EDITOR

export AUTOSSH_PORT=0
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export HGEDITOR=~/dotfiles/hgeditor
export LC_CTYPE=en_US.UTF-8
export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET=utf-8
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export MANWIDTH=80
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/games:$HOME/.rvm/bin
export VIMRUNTIME=`vim -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `

if [ -x ~/.vim/bundle/vimpager/vimpager ]; then
  export MANPAGER=~/.vim/bundle/vimpager/vimpager
fi

if [ -r ~/dotfiles/.profile.${HOSTNAME:=$HOST} ]; then
  source ~/dotfiles/.profile.${HOSTNAME:=$HOST}
fi
