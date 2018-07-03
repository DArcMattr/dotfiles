" PHP
setlocal keywordprg=pman iskeyword+=$
let g:ale_linters['php'] = ['php -l', 'phpcs']
let g:ale_fixers['php'] = ['phpcbf']
let g:ale_php_phpcs_use_global = 1
let g:mta_filetypes['php'] = 1
let g:tagcommands = {'php' : { 'tagfile': $XDG_CONFIG_HOME . '/nvim/php.tags'} }

" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |
" autocmd BufWritePost *.php silent !phpcbf --standard=WordPress %

try
  call LanguageClient_registerServerCommands({'php': [ 'php-language-server' ]})
catch
  " do nothing
endtry
