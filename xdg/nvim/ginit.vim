if exists('g:fvim_loaded')
  set guifont=Delugia:h13

  FVimCustomTitleBar v:true
  FVimFontAutoSnap v:true

  nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<Cr>
  nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<Cr>
endif

tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-l> <C-\><C-N><C-w>l
