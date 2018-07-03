" Cribbed from https://github.com/blueyed/smarty.vim/
if exists('b:did_indent')
  finish
endif

if !exists('g:smarty_indent_verbose')
  let g:smarty_indent_verbose = 0
endif

let s:indentexprs = {}

let s:pairs = {
\ 'php' : ['{php[^>]*}', '', '{/php}', 'bWn'],
\ }

for ft in keys(s:pairs)
  silent! unlet b:did_indent
  exec 'runtime indent/' . ft . '.vim'
  let s:indentexprs[ft] = &l:indentexpr
endfor

silent! unlet b:did_indent
runtime indent/html.vim
let s:indentexprs['html'] = &l:indentexpr

let b:did_indent = 1

setlocal indentexpr=GetSmartyHtmlIndent(v:lnum)

function! s:handle(lnum, ft, searchpairargs)
  let save_cursor = getcurpos()
  exec a:lnum
  let scriptlnum = call('searchpair', a:searchpairargs)
  let prevlnum = prevnonblank(a:lnum)
  call setpos('.', save_cursor)

  if scriptlnum && scriptlnum != prevlnum
    exec 'return ' s:indentexprs[a:ft]
  endif

  return ''
endfun

function! GetSmartyHtmlIndent(lnum)
  for [ft, args] in items(s:pairs)
    let r = call('s:handle', [a:lnum, ft, args])
    if type(r) == type(0)
      if g:smarty_indent_verbose
        echom 'Line ' . a:lnum . ': unsing ' . ft . ' indenting via ' . s:indentexprs[ft] . ': ' . r . '.'
      endif
      return r
    endif
  endfor

  if g:smarty_indent_verbose
    echom 'Line ' . a:lnum . ': using HTML indenting via ' . s:indentexprs['html'] . '.'
  endif
  exec 'return ' s:indentexprs['html']
endfun
