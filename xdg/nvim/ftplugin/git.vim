map <buffer> q ;q<Cr>

autocmd FileType gitcommit if ! &previewwindow && expand('%:t') !~# 'index' | :DiffGitCached | ;resize 20 | endif | exec 'autocmd VimEnter * startinsert'
