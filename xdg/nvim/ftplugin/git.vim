map <buffer> q ;q<Cr>

autocmd FileType gitcommit if |
\   !&previewwindow && expand('%:t') !~# 'index' |
\   :DiffGitCached |
\   ;resize 20 |
\   exec 'wincmd P |
\   setlocal ft=diff |
\   wincmd t' |
\ endif |
\ exec 'autocmd VimEnter * startinsert'
