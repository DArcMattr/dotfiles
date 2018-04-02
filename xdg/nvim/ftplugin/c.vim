if ! filereadable(expand('%'))
  execute '0r ~/dotfiles/lang/c/template.c'
endif

setlocal cinoptions=t0,+4,(4,u4,w1
setlocal shiftwidth=8
setlocal softtabstop=8
setlocal keywordprg=man
