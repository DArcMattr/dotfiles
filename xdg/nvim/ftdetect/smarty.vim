augroup SMARTY
  autocmd!
  autocmd BufRead,BufNewFile *.tpl if &ft == '' |
  \ setfiletype smarty |
  \ endif
augroup END
