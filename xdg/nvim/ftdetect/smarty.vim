autocmd BufRead,BufNewFile *.tpl if &ft == '' | setfiletype smarty | endif
