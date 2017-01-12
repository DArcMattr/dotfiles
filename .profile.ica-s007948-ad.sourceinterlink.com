# vim:ft=sh
umask 022
export PATH=$PATH:$(brew --prefix homebrew/php/php71)/share/php

export PAGER=vimpager
export HOMEBREW_GITHUB_API_TOKEN="3c884dbe31e6c26408bd4d275fdec0f1f8710426"

