setlocal keywordprg=pman
setlocal iskeyword+=$

let g:ale_fixers['php'] = ['phpcbf']
let g:ale_linters['php'] = ['php', 'phpcs']
let g:ale_php_langserver_executable = 'php-language-server'
let g:mta_filetypes['php'] = 1
let b:tagcommands = {'php' : { 'tagfile': $XDG_CONFIG_HOME . '/nvim/php.tags'} }

" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |

try
  call LanguageClient_registerServerCommands({'php': [ 'php-language-server' ]})
catch
  echoerr "PHP Language Server not loaded"
endtry
