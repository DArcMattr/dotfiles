map <buffer> q ;bd<Cr>
if winwidth(0) > 200
  autocmd BufWinEnter <buffer> wincmd H
endif
