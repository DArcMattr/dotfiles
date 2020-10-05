map <buffer> q ;q<Cr>

autocmd VimEnter * exec 'normal gg0' |
  \ startinsert

autocmd FileType gitcommit |
  \ if ! &previewwindow && expand('%:t') !~# 'index' |
  \   exec 'DiffGitCached | setlocal ft=diff | wincmd t | resize 25' |
  \ endif

