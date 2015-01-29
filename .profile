export AUTOSSH_PORT=0
export CLICOLOR=YES
export CLICOLOR_FORCE=YES
export HGEDITOR=~/dotfiles/helpers/hgeditor
export LC_CTYPE=en_US.UTF-8
export LESS="-EFIMQRsX~ -x2"
export LESSCHARSET=utf-8
export LSCOLORS="ExFxCxDxBxEgEdAbAgAcAd"
export MANWIDTH=80
export ANSIBLE_NOCOWS=1

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin
export PATH=$PATH:/usr/sbin:/usr/X11R6/bin:/usr/games:$HOME/.rvm/bin
export PATH=$PATH:~/.composer/vendor/bin

if type "nvim" > /dev/null; then
  EDITOR=`which nvim`
else if type "vim" > /dev/null; then
  EDITOR=`which vim`
else
  EDITOR=`which vi`
fi
export EDITOR


if [ -x ~/.vim/bundle/vimpager/vimpager ]; then
  export MANPAGER=~/.vim/bundle/vimpager/vimpager
  alias vimcat='~/.vim/bundle/vimpager/vimcat'
  alias vimpager='~/.vim/bundle/vimpager/vimpager'
fi

if [ -r ~/dotfiles/.profile.${HOSTNAME:=$HOST} ]; then
  source ~/dotfiles/.profile.${HOSTNAME:=$HOST}
fi
