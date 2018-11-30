autocmd FileType ruby setlocal keywordprg=ri

let b:tagcommands = {'ruby': { 'tagfile': $XDG_CONFIG_HOME . '/nvim/ruby.tags' } }

try
  call LanguageClient_registerServerCommands({'scss': [ 'solargraph', 'stdio' ]})
catch
  " do nothing
endtry
