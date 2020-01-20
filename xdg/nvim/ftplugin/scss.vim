setlocal iskeyword+=.,#

let g:ale_linters['scss'] = ['stylelint']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_scss_stylelint_options = '--config ~/.config/yarn/global/package.json'
let g:ale_scss_stylelint_use_global = 1
let g:LanguageClient_serverCommands['scss'] = [ 'css-languageserver', '--stdio' ]
