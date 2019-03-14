autocmd FileType ruby setlocal keywordprg=ri

let b:tagcommands['ruby'] = { 'tagfile': $XDG_CONFIG_HOME . '/nvim/ruby.tags' }
let g:LanguageClient_serverCommands['python'] = ['python-language-server']
