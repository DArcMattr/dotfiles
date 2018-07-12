setlocal iskeyword+=.,#

let g:ale_linters['css'] = ['stylelint']
let g:ale_fixers['css'] = ['stylelint']
let g:ale_css_stylelint_use_global = 1

try
  call LanguageClient_registerServerCommands({'css': [ 'vscode-css-languageservice', '--stdio' ]})
catch
  " do nothing
endtry
