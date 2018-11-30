setlocal iskeyword+=.,#

let g:ale_linters['scss'] = ['stylelint']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_scss_stylelint_use_global = 1

try
  call LanguageClient_registerServerCommands({'scss': [ 'css-languageserver', '--stdio' ]})
catch
  " do nothing
endtry
