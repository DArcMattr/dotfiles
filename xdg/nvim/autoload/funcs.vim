function! funcs#SetDiffColors()
  highlight DiffAdd cterm=bold ctermfg=white ctermbg=DarkGreen guifg=#ffffff guibg=#005f00
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey guifg=#ffffff guibg=#a9a9a9
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue guifg=#ffffff guibg=#00008b
  highlight DiffText cterm=bold ctermfg=white ctermbg=DarkRed guifg=#ffffff guibg=#8b0000
endfunction

function! funcs#SetColorColumn()
  execute 'match OverLength /\%'. ( (&textwidth ?? 80) + 1 ) .'v.*/'
endfunction

function! funcs#TmuxMove(direction)
  " Check if we are currently focusing on a edge window.
  " To achieve that,  move to/from the requested window and
  " see if the window number changed
  let oldw = winnr()
  silent! execute 'wincmd ' . a:direction
  let neww = winnr()
  silent! execute oldw . 'wincmd'
  if oldw == neww
    " The focused window is at an edge, so ask tmux to switch panes
    if a:direction == 'j'
      call system("tmux select-pane -D")
    elseif a:direction == 'k'
      call system("tmux select-pane -U")
    elseif a:direction == 'h'
      call system("tmux select-pane -L")
    elseif a:direction == 'l'
      call system("tmux select-pane -R")
    endif
  else
    execute 'wincmd ' . a:direction
  end
endfunction
