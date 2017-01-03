# vim:ft=sh
#if [ -d /usr/local/lib/python2.7/site-packages ]; then
  #export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#fi
export PATH=$PATH:$(brew --prefix)/share/python
export PATH=$PATH:$(brew --prefix homebrew/php/php70)/share/php

export PAGER=vimpager
export HOMEBREW_GITHUB_API_TOKEN="3c884dbe31e6c26408bd4d275fdec0f1f8710426"

