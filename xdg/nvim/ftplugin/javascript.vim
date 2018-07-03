let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:tagcommands = { 'javascript' : { 'tagfile' : $XDG_CONFIG_HOME . '/nvim/js.tags' } }
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_linters['javascript'] = ['eslint']

autocmd FileType javascript setlocal iskeyword+=$

try
  call LanguageClient_registerServerCommands({'javascript': [ 'javascript-typescript-stdio' ] })
catch
  " do nothing
endtry
