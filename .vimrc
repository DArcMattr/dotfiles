set nocompatible
filetype off " required by vundle

let $GIT_SSL_NO_VERIFY = 'true'
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
if has('python')
  Bundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim/' }
else
  set ruler
  set statusline=[%n]\ %<%.99f
  set statusline+=\ %h%w%m%r
  set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
  set statusline+=%y%=%-16(\ %l,%c-%v\ %)%P
endif
Bundle 'Lokaltog/vim-easymotion'
Bundle 'embear/vim-localvimrc'
Bundle 'ervandew/supertab'
"Bundle 'joonty/vim-phpqa'
Bundle 'joonty/vim-phpunitqf'
Bundle 'joonty/vim-taggatron'
Bundle 'joonty/vdebug'
Bundle 'kien/ctrlp.vim'
Bundle 'kloppster/Wordpress-Vim-Syntax'
Bundle 'krisajenkins/vim-pipe'
Bundle 'krisajenkins/vim-postgresql-syntax'
Bundle 'phleet/vim-mercenary'
Bundle 'scrooloose/syntastic'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tristen/vim-sparkup'
Bundle 'tsaleh/vim-matchit'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'guns/xterm-color-table.vim'

filetype plugin indent on " also required by vundle
colorscheme vividchalk
syntax on

set autoread
set backspace=indent,eol,start
set diffopt=filler,vertical
set encoding=utf-8
set expandtab
set fillchars+=stl:\ ,stlnc:\
set formatoptions=qrn1
set grepprg=grep\ -nH\ $*
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
if has('multi_byte')
  set listchars=eol:↲,precedes:«,extends:»,trail:·,tab:▸·
else
  set listchars=eol:$,precedes:<,extends:>,trail:.,tab:>·
endif
set matchtime=5
set mouse=a
set nobackup
set noshowmode
set noswapfile
set relativenumber
set number
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set scrolloff=3
set shiftwidth=2
set shortmess=atIA
set showbreak=>
set showmatch
set smartcase
set smartindent
set softtabstop=2
set textwidth=80
set ttyfast
set colorcolumn=+1
set t_Co=256
set tabstop=2
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.git,.svn,.hg,tmp/**

highlight NonText ctermfg=235 guifg=#262626
highlight SpecialKey ctermfg=235 guifg=#262626
highlight LineNr term=reverse cterm=bold ctermfg=251 ctermbg=17
highlight LineNr gui=bold guifg=#c6c6c6 guibg=#00005f
highlight OverLength ctermbg=234 ctermfg=249
highlight OverLength guibg=#1c1c1c guifg=#b2b2b2
match OverLength /\%81v.\+/

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
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
      set printfont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
    else
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
      set printfont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
    endif
    if ! has("X11") " for qvim
      "set fu
      "set guioptions=-Mt
    else
    endif
    set guioptions=aegiMprLtT
  else
  endif
  if filereadable("/usr/local/bin/bash")
    set shell=/usr/local/bin/bash
  else
    set shell=/bin/bash
  endif
  let $BASH_ENV = '~/.bashrc' " what to do for ksh/zsh?
  set shellcmdflag=-O\ expand_aliases\ -c
  if &term=~'^screen'
    set ttymouse=xterm2
  endif
endif

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
else
endif

let mapleader = ","

" key remappings - toggle spell checking
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <C-o>:setlocal spell! spelllang=en_us<cr>
nmap <silent> ,/ :nohlsearch<CR>

map <C-Tab> gt
map <C-S-Tab> gT

nmap j gj
nmap k gk
nmap . .'[

nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"in case of derp-sudo
cmap w!! w !sudo tee % >/dev/null

" plugin specific settings
let g:SuperTabDefaultCompletionType = ""
let g:localvimrc_sandbox=0
let g:localvimrc_whitelist='/var/www/vhosts/\(metagenics\).*'
let g:ctrlp_show_hidden=1
let g:EasyMotion_leader_key="<leader>"
let g:NumberToggleTrigger="<leader>l"
let g:syntastic_php_checkers=[ 'php' ]
let g:sparkupExecuteMapping="<leader>se"
let g:sparkupNextMapping="<leader>sn"

command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'

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
  " @link https://groups.google.com/forum/?fromgroups=#!topic/vim_use/ZNZcBAABDgE
  augroup AutoDiffUpdate
    autocmd!
    autocmd InsertLeave *
      \ if &diff |
      \   diffupdate |
      \   let b:old_changedtick = b:changedtick |
      \ endif
    autocmd CursorHold *
      \ if &diff &&
      \    (!exists('b:old_changedtick') || b:old_changedtick != b:changedtick) |
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

  " Perl
  autocmd BufNewFile,BufRead *.pl,*.pm set makeprg=perl
  autocmd BufNewFile,BufRead *.pl,*.pm compiler perl

  " Lua
  autocmd FileType lua shiftwidth=4 tabstop=4 softtabstop=4 smarttab noexpandtab
  autocmd BufEnter *.lua set autoindent tabstop=4 softtabstop=4 smarttab
    \ noexpandtab formatoptions=croql

  " Python
  autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4 smarttab
    \ expandtab
  autocmd BufEnter *.py set autoindent tabstop=4 softtabstop=4 smarttab expandtab
    \ formatoptions=croql
  autocmd FileType python :let b:vimpipe_command="python"
  autocmd FileType python :let b:vimpipe_filetype="python"

  " C
  autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8 softtabstop=8
  let c_space_errors=1

  " hg commit messages
  autocmd BufRead,BufNewFile /tmp/hgeditor/msg setf hgcommit
  autocmd FileType hgcommit set textwidth=72
    \ match OverLength /\%73v.\+/

  " PostgreSQL
  autocmd BufNewFile,BufRead *.psql setf postgresql
  autocmd FileType postgresql :let b:vimpipe_command="psql mydatabase"
  autocmd FileType postgresql :let b:vimpipe_filetype="postgresql"

  " Apache
  autocmd BufNewFile,BufRead *.conf setf apache

  " Markdown
  autocmd BufRead,BufNewFile *.md setf markdown

  " SCSS
  autocmd BufRead,BufNewFile *.scss setf scss
endif
