setlocal keywordprg=pman
setlocal iskeyword+=$
setlocal suffixesadd+=.php

let b:tagcommands = {'php' : { 'tagfile': $XDG_CONFIG_HOME . '/nvim/php.tags'} }

let g:ale_fixers['php'] = ['phpcbf']
let g:ale_linters['php'] = ['php', 'phpcs']
let g:ale_php_langserver_executable = 'php-language-server.php'
let g:mta_filetypes['php'] = 1
let g:LanguageClient_serverCommands['php'] = ['php-language-server.php']
let g:ultisnips_php_scalar_types = 1

" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |
