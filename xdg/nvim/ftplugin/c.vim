if ! filereadable(expand('%'))
  execute '0r ~/dotfiles/lang/c/template.c'
endif

set cinoptions=t0,+4,(4,u4,w1
set shiftwidth=8
set softtabstop=8
set keywordprg=man
