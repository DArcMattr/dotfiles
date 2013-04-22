# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -d /usr/texbin ]; then
  PATH=$PATH:/usr/texbin
fi

if [ -d /usr/local/share/npm/bin ]; then
  PATH=$PATH/usr/local/share/npm/bin
fi

PATH=$PATH:$HOME/bin:/usr/sbin

export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
