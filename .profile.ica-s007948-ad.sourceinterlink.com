# vim:ft=sh
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
export PATH=$PATH:$(brew --prefix)/share/python

export PAGER=vimpager
export HOMEBREW_GITHUB_API_TOKEN="3c884dbe31e6c26408bd4d275fdec0f1f8710426"

