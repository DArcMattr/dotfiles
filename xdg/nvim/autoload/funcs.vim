function! funcs#SetDiffColors()
  highlight DiffAdd cterm=bold ctermfg=white ctermbg=DarkGreen guifg=#ffffff guibg=#005f00
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey guifg=#ffffff guibg=#a9a9a9
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue guifg=#ffffff guibg=#00008b
  highlight DiffText cterm=bold ctermfg=white ctermbg=DarkRed guifg=#ffffff guibg=#8b0000
endfunction

function! funcs#SetColorColumn()
  execute 'match OverLength /\%'. ( (&textwidth ?? 80) + 1 ) .'v.*/'
endfunction
