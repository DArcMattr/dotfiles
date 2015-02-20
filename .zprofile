if type "nvim" > /dev/null; then
  EDITOR=`which nvim`
elif type "vim" > /dev/null; then
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
