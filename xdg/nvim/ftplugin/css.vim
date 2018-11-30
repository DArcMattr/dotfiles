setlocal iskeyword+=.,#

let g:ale_linters['css'] = ['stylelint']
let g:ale_fixers['css'] = ['stylelint']
let g:ale_css_stylelint_use_global = 1
"let g:ale_css_stylelint_options = '--config=$HOME/.config/yarn/global/node_modules/stylelint-config-recommended/'

try
  call LanguageClient_registerServerCommands({'css': [ 'css-languageserver', '--stdio' ]})
catch
  " do nothing
endtry
