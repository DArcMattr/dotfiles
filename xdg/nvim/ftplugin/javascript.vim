autocmd FileType javascript setlocal iskeyword+=$

let b:tagcommands = { 'javascript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/js.tags' } }

let g:ale_fixers['javascript'] = ['eslint']
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters['javascript'] = ['eslint']
let g:LanguageClient_serverCommands['javascript'] = ['javascript-typescript-stdio']
