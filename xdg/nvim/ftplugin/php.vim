" PHP
setlocal keywordprg=pman iskeyword+=$
" setlocal foldmarker={,} foldmethod=marker foldlevel=1 |

" autocmd BufWritePost *.php silent !phpcbf --standard=WordPress %

try
	call LanguageClient_registerServerCommands({'php':[ 'php', 'php-language-server --memory-limit=512M' ]})
catch
	" do nothing
endtry
