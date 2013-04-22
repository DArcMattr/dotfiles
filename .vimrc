filetype off " required by vundle

let $GIT_SSL_NO_VERIFY = 'true'
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Lokaltog/powerline'
Bundle 'gmarik/vundle'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'krisajenkins/vim-pipe'
Bundle 'krisajenkins/vim-postgresql-syntax'
Bundle 'ludovicPelle/vim-xdebug'
Bundle 'othree/html5-syntax.vim'
Bundle 'phleet/vim-mercenary'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tsaleh/vim-matchit'

filetype plugin indent on " also required by vundle
colorscheme vividchalk
syntax on

set autoread
set backspace=indent,eol,start
set diffopt=filler,vertical
set encoding=utf-8
set expandtab
set fillchars+=stl:\ ,stlnc:\
set grepprg=grep\ -nH\ $*
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set matchtime=5
set mouse=a
set nobackup
set nocompatible
set noshowmode
set noswapfile
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set ruler
set scrolloff=3
set shiftwidth=2
set shortmess=atIA
set showbreak=>
set showmatch
set smartcase
set smartindent
set softtabstop=2
set t_Co=256
set tabstop=2
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest

" Window title
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
    set guifont=Meslo\ LG\ S\ 12
    if ! has("X11")
      set fu " qvim specific
      "set guioptions=-Mt
      set guioptions=aegiMprLtT
    else
      set guioptions=aegiMprLtT
    endif
  else
  endif
  set printfont=Meslo\ LG\ S\ 7
  let s:uname=system("uname")
  if s:uname=="OpenBSD"
    set shell=/usr/local/bin/bash
  else
    set shell=/bin/bash
  endif
  let $BASH_ENV = '~/.bashrc' " what to do for ksh/zsh?
  set shellcmdflag=-O\ expand_aliases\ -c
endif

if has('python')
  " powerline is b0rking graphical vim
  if has('gui_running')
    set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
  else
    set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim
  endif
else
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
endif

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" key remappings - toggle spell checking
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <C-o>:setlocal spell! spelllang=en_us<cr>

map <C-Tab> gt
map <C-S-Tab> gT

nmap j gj
nmap k gk
nmap . .'[

nnoremap ' `
nnoremap ` '
"nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" make regex more sane
nnoremap / /\v
vnoremap / /\v

"in case of derp-sudo
cmap w!! w !sudo tee % >/dev/null

let mapleader = ","

" Trim whitespace from the end of lines
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" update diffs aggressively
" @link https://groups.google.com/forum/?fromgroups=#!topic/vim_use/ZNZcBAABDgE
augroup AutoDiffUpdate
  au!
  autocmd InsertLeave * if &diff | diffupdate | let b:old_changedtick = b:changedtick | endif
  autocmd CursorHold *
        \ if &diff &&
        \    (!exists('b:old_changedtick') || b:old_changedtick != b:changedtick) |
        \   let b:old_changedtick = b:changedtick | diffupdate |
        \ endif
augroup END

augroup CursorColumn
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Perl
autocmd BufNewFile,BufRead *.pl,*.pm set makeprg=perl
autocmd BufNewFile,BufRead *.pl,*.pm compiler perl

" Lua
autocmd FileType lua set textwidth=80 shiftwidth=4 tabstop=4
  \ softtabstop=4 smarttab noexpandtab colorcolumn=+1
autocmd BufEnter *.lua set autoindent textwidth=80 shiftwidth=4
  \ tabstop=4 softtabstop=4 smarttab noexpandtab formatoptions=croql
  \ colorcolumn=+1

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set textwidth=80 shiftwidth=4 tabstop=4
  \ softtabstop=4 smarttab expandtab colorcolumn=+1
autocmd BufEnter *.py set autoindent textwidth=80 shiftwidth=4
  \ tabstop=4 softtabstop=4 smarttab expandtab formatoptions=croql
  \ colorcolumn=+1
autocmd FileType python :let b:vimpipe_command="python"
autocmd FileType python :let b:vimpipe_filetype="python"

" C
autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8
  \ softtabstop=8
let c_space_errors=1

" hg commit messages
autocmd BufRead,BufNewFile /tmp/hgeditor/msg setf hgcommit
autocmd FileType hgcommit set textwidth=72
  \ let &colorcolumn=join(range(73,999),",")

" PostgreSQL
autocmd BufNewFile,BufRead *.psql setf postgresql
autocmd FileType postgresql :let b:vimpipe_command="psql mydatabase"
autocmd FileType postgresql :let b:vimpipe_filetype="postgresql"

" Apache
autocmd BufNewFile,BufRead *.conf setf apache

autocmd BufRead *.aspx set filetype=html
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \  if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \  endif
endif
