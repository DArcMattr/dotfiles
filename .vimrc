filetype off " required by NeoBundle

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  call neobundle#rc( expand('~/.vim/bundle/') )
endif

NeoBundleFetch 'Shougo/neobundle.vim'

if has('python')
  NeoBundle 'Valloric/YouCompleteMe.git', {
  \   'build' : {
  \     'unix' : './install.sh --clang-completer --system-libclang',
  \   },
  \ }
endif

if has('signs')
  NeoBundle 'joonty/vim-phpqa'
  NeoBundle 'joonty/vim-phpunitqf'
endif

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'windows' : 'make -f make_mingw32.mak',
\   'cygwin'  : 'make -f make_cygwin.mak',
\   'mac'     : 'make -f make_mac.mak',
\   'unix'    : 'make -f make_unix.mak',
\  },
\ }
NeoBundle 'DArcMattr/vim-numbertoggle'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'bitbucket:ludovicchabant/vim-lawrencium', { 'type': 'hg' }
NeoBundle 'bling/vim-airline'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'ervandew/supertab'
NeoBundle 'haya14busa/vim-easymotion'
NeoBundle 'joonty/vdebug'
NeoBundle 'UmkaDK/vim-taggatron'
NeoBundle 'kloppster/Wordpress-Vim-Syntax'
NeoBundle 'krisajenkins/vim-pipe'
NeoBundle 'krisajenkins/vim-postgresql-syntax'
NeoBundle 'reedes/vim-wheel'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'tristen/vim-sparkup'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/smarty-syntax'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'

filetype plugin indent on " required by NeoBundle
syntax on
colo vividchalk
NeoBundleCheck

set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=+1
set complete-=i
set diffopt=filler,vertical
set display+=lastline
set encoding=utf-8 nobomb
set esckeys
set expandtab
set fillchars+=stl:\ ,stlnc:\
set formatoptions=nqr12
set gdefault
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
elseif executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
else
  set grepprg=grep\ -nH\ $*
endif
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
if has('multi_byte')
  set listchars=eol:↲,precedes:«,extends:»,trail:·,tab:▸·
else
  set listchars=eol:$,precedes:<,extends:>,trail:.,tab:>·
endif
set matchtime=5
set modeline
set mouse=a
set nobackup
set nojoinspaces
set nostartofline
set noswapfile
set nowrap
set nrformats-=octal
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set scrolloff=3
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set shiftround
set shiftwidth=2
set shortmess=atIA
set showbreak=>
set showmatch
set sidescrolloff=5
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set textwidth=80
if &term =~? 'mlterm\|xterm\|screen'
  set t_Co=256
else
  set t_Co=88
endif
set ttimeout
set ttyfast
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.git,.svn,.hg,tmp/**

if &t_Co >= 256 || has('gui_running')
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare
  highlight CursorColumn cterm=NONE ctermbg=237 guibg=#3a3a3a
  highlight CursorLine cterm=NONE ctermbg=237 guibg=#3a3a3a
  highlight LineNr gui=bold guifg=#c6c6c6 guibg=#00005f
  highlight LineNr term=reverse cterm=bold ctermfg=251 ctermbg=17
  highlight NonText ctermfg=235 guifg=#262626
  highlight OverLength ctermbg=234 ctermfg=249
  highlight OverLength guibg=#1c1c1c guifg=#b2b2b2
  highlight Search ctermfg=222 guifg=#ffdf87
  highlight SpecialKey ctermfg=235 guifg=#262626
  highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline guifg=#800000 gui=underline
  highlight SpellCap term=underline cterm=underline gui=underline
  highlight SpellLocal term=underline cterm=underline gui=underline
  highlight SpellRare term=underline cterm=underline gui=underline

  match OverLength /\%81v.\+/
else
  " nop!
endif

if has('title')
  set title
  set titlestring=%t%(\ [%R%M]%)
endif

if has("win32")
  if has("gui_running")
    set guifont=consolas:h12
    autocmd GUIEnter * simalt ~x " start out maximized, else, fit to term
  endif
  set shellslash
  set printfont=consolas:h7
  noremap <C-kPlus> <C-A> " increment a number
  noremap <C-kMinus> <C-X> " decrement a number
  noremap <C-K> <C-V> " enter an extended character
elseif has("unix")
  if has("gui_running")
    if has('gui_macvim')
      set fullscreen
      set fuoptions=maxvert,maxhorz
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
      set guioptions=egm
      set printfont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
    else
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
      set printfont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
    endif
    if ! has("X11") " for qvim
      "set fu
      "set guioptions=-Mt
    else
    endif
    " set guioptions=aegiMpLtT
  else
    "nop!
  endif

  if filereadable("/bin/bash")
    set shell=/bin/bash
  elseif filereadable("/usr/local/bin/bash")
    set shell=/usr/local/bin/bash
  endif
  let $PAGER=''
  let $BASH_ENV = '~/.bashrc' " what to do for ksh/zsh?
  set shellcmdflag=-O\ expand_aliases\ -c
  if &term=~'^screen'
    set ttymouse=xterm2
  endif
endif

if ! has('gui_running')
  set ttimeoutlen=10
  if has('autocmd')
    augroup FastEscape
      autocmd!
      autocmd InsertEnter * set timeoutlen=0
      autocmd InsertLeave * set timeoutlen=1000
    augroup END
  endif
else
  set linespace=1
endif

let mapleader = ","

" key remappings - toggle spell checking
map <F7> :setlocal spell! spelllang=en_us<CR>
imap <F7> <C-o>:setlocal spell! spelllang=en_us<CR>
imap <C-c> <CR><Esc>O


map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>
map <leader>os :call RestoreSess()

nmap <C-PageUp> :tabp<CR>
nmap <C-PageDown> :tabn<CR>
nmap . .'[
nmap <leader>q :nohlsearch<CR>

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <C-p> :Unite file_rec/async<CR>
nnoremap <leader>/ :Unite grep:.<CR>
nnoremap <silent> <c-w>j :silent call TmuxMove('j')<cr>
nnoremap <silent> <c-w>k :silent call TmuxMove('k')<cr>
nnoremap <silent> <c-w>h :silent call TmuxMove('h')<cr>
nnoremap <silent> <c-w>l :silent call TmuxMove('l')<cr>
nnoremap <silent> <c-w><down> :silent call TmuxMove('j')<cr>
nnoremap <silent> <c-w><up> :silent call TmuxMove('k')<cr>
nnoremap <silent> <c-w><left> :silent call TmuxMove('h')<cr>
nnoremap <silent> <c-w><right> :silent call TmuxMove('l')<cr>

"in case of derp-sudo
cmap w!! w !sudo tee % >/dev/null

" plugin specific settings
let $GIT_SSL_NO_VERIFY = 'true'

let g:DirDiffDynamicDiffText = 1
let g:EasyMotion_leader_key='<leader>'
let g:NumberToggleTrigger='<leader>l'
let g:SuperTabDefaultCompletionType = ''
let g:VCSCommandSplit='vertical'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#quickfix#location_text='Location'
let g:airline#extensions#quickfix#quickfix_text='Quickfix'
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:localvimrc_persistent=1
let g:localvimrc_sandbox=0
let g:localvimrc_whitelist='/var/www/vhosts/*/.*'
let g:phpqa_codecoverage_autorun=0 " default is 0
let g:phpqa_codesniffer_autorun=0  " default is 1
let g:phpqa_messdetecter_autorun=0 " default is 1
let g:phpqa_open_loc=0             " default is 1
let g:session_autoload='no'
let g:session_autosave='no'
let g:sparkupExecuteMapping='<leader>se'
let g:sparkupNextMapping='<leader>sn'
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='⧰'
let g:syntastic_php_checkers=[ 'php' ]
let g:syntastic_warning_symbol='⚠'
let g:ycm_filetype_blacklist = { 'markdown': 1, 'text': 1, }

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
  \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

command! -nargs=1 Silent |
\ execute ':silent !'.<q-args> |
\ execute ':redraw!'

command! -nargs=* -complete=help Help vertical belowright help <args>

" from https://gist.github.com/tarruda/5158535
if $TMUX != ''
  function! TmuxMove(direction)
    " Check if we are currently focusing on a edge window.
    " To achieve that,  move to/from the requested window and
    " see if the window number changed
    let oldw = winnr()
    silent! exe 'wincmd ' . a:direction
    let neww = winnr()
    silent! exe oldw . 'wincmd'
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
      exe 'wincmd ' . a:direction
    end
  endfunction
endif

if has('autocmd')
  if exists('+omnifunc')
    autocmd Filetype *
    \  if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \  endif
  endif

  augroup TrimWhitespace
    autocmd!
    autocmd BufRead,BufWrite *
    \ if ! &bin |
    \   silent! %s/\s\+$//ge |
    \ endif
  augroup END

  " update diffs aggressively
  " https://groups.google.com/forum/?fromgroups=#!topic/vim_use/ZNZcBAABDgE
  augroup AutoDiffUpdate
    autocmd!
    autocmd InsertLeave *
    \ if &diff |
    \   diffupdate |
    \   let b:old_changedtick = b:changedtick |
    \ endif
    autocmd CursorHold *
    \ if &diff &&
    \     (!exists('b:old_changedtick') || b:old_changedtick != b:changedtick) |
    \   let b:old_changedtick = b:changedtick | diffupdate |
    \ endif
  augroup END

  augroup CursorColumn
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    autocmd WinLeave * setlocal nocursorcolumn
  augroup END

  augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
  augroup END

  augroup ShowListChars
    autocmd!
    autocmd InsertEnter * set nolist
    autocmd InsertLeave * set list
  augroup END

  "autocmd BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

  " common filetypes below

  " Perl
  autocmd BufNewFile,BufRead,BufEnter *.pl,*.pm set makeprg=perl
  autocmd BufNewFile,BufRead,BufEnter *.pl,*.pm compiler perl

  " Lua
  autocmd FileType lua shiftwidth=4 tabstop=4 softtabstop=4 smarttab noexpandtab
  autocmd BufEnter *.lua set autoindent tabstop=4 softtabstop=4 smarttab
  \ noexpandtab formatoptions=croql

  " Python
  autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4 smarttab
  \ expandtab
  autocmd BufNewFile,BufRead,BufEnter *.py set autoindent tabstop=4
  \ softtabstop=4 smarttab formatoptions=croql
  autocmd FileType python :let b:vimpipe_command="python"
  autocmd FileType python :let b:vimpipe_filetype="python"

  " C
  autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8 softtabstop=8
  let c_space_errors=1

  " golang
  autocmd FileType go autocmd BufWritePre <buffer> Fmt

  " hg commit messages
  autocmd BufNewFile,BufRead,BufEnter msg setf hgcommit
  autocmd FileType hgcommit set textwidth=72
  autocmd FileType hgcommit match OverLength /\%73v.\+/

  " PostgreSQL
  autocmd BufNewFile,BufRead,BufEnter *.psql setf postgresql
  autocmd FileType postgresql :let b:vimpipe_command="psql mydatabase"
  autocmd FileType postgresql :let b:vimpipe_filetype="postgresql"

  " Markdown
  autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown setf markdown

  " tmux
  autocmd BufNewFile,BufRead,BufEnter .tmux*,*/tmux-sessions/* setf tmux

  " Apache
  autocmd BufNewFile,BufRead,BufEnter *.conf setf apache
endif
