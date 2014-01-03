filetype off " required by NeoBundle
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc( expand('~/.vim/bundle/') )

NeoBundleFetch 'Shougo/neobundle.vim'
if has('python')
  NeoBundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim/' }
else
  set ruler
  set showmode
  set statusline=[%n]\ %<%.99f
  set statusline+=\ %h%w%m%r
  set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
  set statusline+=%y%=%-16(\ %l,%c-%v\ %)%P
endif
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'windows' : 'make -f make_mingw32.mak',
\   'cygwin'  : 'make -f make_cygwin.mak',
\   'mac'     : 'make -f make_mac.mak',
\   'unix'    : 'make -f make_unix.mak',
\  },
\ }
NeoBundle 'Valloric/YouCompleteMe.git', {
\   'build' : {
\     'unix' : './install.sh --clang-completer --system-libclang',
\   },
\ }
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'DArcMattr/vim-numbertoggle'
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'ervandew/supertab'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'joonty/vim-phpqa'
NeoBundle 'joonty/vim-phpunitqf'
NeoBundle 'joonty/vim-taggatron'
NeoBundle 'joonty/vdebug'
NeoBundle 'kloppster/Wordpress-Vim-Syntax'
NeoBundle 'krisajenkins/vim-pipe'
NeoBundle 'krisajenkins/vim-postgresql-syntax'
NeoBundle 'phleet/vim-mercenary'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'tristen/vim-sparkup'
NeoBundle 'tsaleh/vim-matchit'
NeoBundle 'vim-scripts/vcscommand.vim'

filetype plugin indent on " required by NeoBundle
syntax on
colo vividchalk
NeoBundleCheck

set autoread
set backspace=indent,eol,start
set clipboard=unnamed
set colorcolumn=+1
set diffopt=filler,vertical
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
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set scrolloff=3
set sessionoptions-=options " Don't Save Options
set shiftwidth=2
set shortmess=atIA
set showbreak=>
set showmatch
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set textwidth=80
set ttyfast
if &term =~? 'mlterm\|xterm\|screen'
  set t_Co=256
else
  set t_Co=88
endif
set tabstop=2
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.git,.svn,.hg,tmp/**


if &t_Co >= 256 || has('gui_running')
  highlight CursorLine cterm=NONE ctermbg=237 guibg=#3a3a3a
  highlight CursorColumn cterm=NONE ctermbg=237 guibg=#3a3a3a
  highlight LineNr term=reverse cterm=bold ctermfg=251 ctermbg=17
  highlight LineNr gui=bold guifg=#c6c6c6 guibg=#00005f
  highlight NonText ctermfg=235 guifg=#262626
  highlight OverLength ctermbg=234 ctermfg=249
  highlight OverLength guibg=#1c1c1c guifg=#b2b2b2
  highlight Search ctermfg=222 guifg=#ffdf87
  highlight SpecialKey ctermfg=235 guifg=#262626

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
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
      set printfont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
      set guioptions=egm
      set fullscreen
      set fuoptions=maxvert,maxhorz
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
let $GIT_SSL_NO_VERIFY = 'true'

" key remappings - toggle spell checking
map <F7> :setlocal spell! spelllang=en_us<CR>
imap <F7> <C-o>:setlocal spell! spelllang=en_us<CR>
imap <C-c> <CR><Esc>O

"map <C-Tab> gt
"map <C-S-Tab> gT
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gl :Glog<CR>
map <leader>gp :Gpush<CR>
map <leader>os :call RestoreSess()

nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nmap . .'[
nmap <leader>q :nohlsearch<CR>

nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <C-p> :Unite file_rec/async<CR>
nnoremap <leader>/ :Unite grep:.<CR>

"in case of derp-sudo
cmap w!! w !sudo tee % >/dev/null

" plugin specific settings
let g:EasyMotion_leader_key="<leader>"
let g:NumberToggleTrigger="<leader>l"
let g:SuperTabDefaultCompletionType = ""
let g:localvimrc_sandbox=0
let g:localvimrc_whitelist='/var/www/vhosts/*/.*'
let g:phpqa_codecoverage_autorun=0 " default is 0
let g:phpqa_codesniffer_autorun=0  " default is 1
let g:phpqa_messdetecter_autorun=0 " default is 1
let g:phpqa_open_loc=0             " default is 1
let g:sparkupExecuteMapping="<leader>se"
let g:sparkupNextMapping="<leader>sn"
let g:syntastic_check_on_open=0
let g:syntastic_php_checkers=[ 'php' ]
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

" From http://stackoverflow.com/a/5149992
" not feasible to use in a general setting, but handy in a .lvimrc
function! SaveSess()
  execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

function! RestoreSess()
  if filereadable( getcwd() . '/.session.vim' )
    execute 'source ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l in range( 1, bufnr( '$' ) )
        if bufwinnr( l ) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

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

"  augroup SaveSession
"    autocmd!
"    autocmd VimLeave * call SaveSess()
"  augroup END

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
  \ softtabstop=4 smarttab expandtab formatoptions=croql
  autocmd FileType python :let b:vimpipe_command="python"
  autocmd FileType python :let b:vimpipe_filetype="python"

  " C
  autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8 softtabstop=8
  let c_space_errors=1

  " PHP

  " hg commit messages
  autocmd BufNewFile,BufRead,BufEnter msg setf hgcommit
  autocmd FileType hgcommit set textwidth=72
  autocmd FileType hgcommit match OverLength /\%73v.\+/

  " PostgreSQL
  autocmd BufNewFile,BufRead,BufEnter *.psql setf postgresql
  autocmd FileType postgresql :let b:vimpipe_command="psql mydatabase"
  autocmd FileType postgresql :let b:vimpipe_filetype="postgresql"

  " Apache
  autocmd BufNewFile,BufRead,BufEnter *.conf setf apache

  " Markdown
  autocmd BufNewFile,BufRead,BufEnter *.md setf markdown

  " tmux
  autocmd BufNewFile,BufRead,BufEnter .tmux.conf setf tmux

  " SCSS
  autocmd BufNewFile,BufRead,BufEnter *.scss setf scss
endif
