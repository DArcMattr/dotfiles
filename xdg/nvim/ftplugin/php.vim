setlocal keywordprg=pman iskeyword+=$

let g:ale_linters['php'] = ['php', 'phpcs']
let g:ale_fixers['php'] = ['phpcbf']
let g:ale_php_langserver_executable = 'php-language-server'
let g:mta_filetypes['php'] = 1
let g:tagcommands = {'php' : { 'tagfile': $XDG_CONFIG_HOME . '/nvim/php.tags'} }

" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |
" autocmd BufWritePost *.php silent !phpcbf --standard=WordPress %

try
  call LanguageClient_registerServerCommands({'php': [ 'php-language-server' ]})
catch
  " do nothing
endtry
