map <buffer> q :q<Cr>

autocmd BufRead,BufNewFile COMMIT_EDITMSG :DiffGitCached
