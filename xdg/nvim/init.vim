if !1 | finish | endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
else
  let g:make = 'gmake'
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/denite.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py --clang-completer --tern-completer --gocode-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic' | Plug 'joseluis/wordpress.vim', { 'branch' : 'develop' }
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'equalsraf/neovim-gui-shim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'joonty/vdebug'
Plug 'joonty/vim-taggatron'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'reedes/vim-wheel'
Plug 'rkitover/vimpager'
Plug 'shawncplus/phpcomplete.vim', { 'for': [ 'php', 'php.wordpress' ] }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'tristen/vim-sparkup', { 'for': [ 'html', 'php' ] }
Plug 'vim-scripts/DirDiff.vim'
Plug 'vim-scripts/csv.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/vcscommand.vim'
call plug#end()

set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=+1
set complete-=i
set completeopt=menu,menuone,longest
set diffopt=filler,vertical
set display+=lastline
set encoding=utf-8
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
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=eol:↲,precedes:«,extends:»,trail:·,tab:▸·,nbsp:¯
set matchtime=5
set modeline
set mouse=a
set nobomb
set nojoinspaces
set nostartofline
set noswapfile
set nowrap
set nrformats-=octal
set number
set path+=**
set previewheight=20
set printheader=%<%f%h%m\ %40
set printheader=+{strftime(\"%c\"getftime(expand(\"%%\")))}%=Page\ %N
set printoptions=formfeed:y,paper:letter,portrait:n,number:y,syntax:7
set printoptions+=left:5mm,right:5mm,top:10mm,bottom:5mm
set pumheight=15
set relativenumber
set scrolloff=3
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set shiftround
set shiftwidth=2
set shortmess=atIAoO
set showbreak=>
set showcmd
set showmatch
set sidescrolloff=5
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set synmaxcol=512
set tabstop=2
set termguicolors
set textwidth=80
set title
set titlestring=%t%(\ [%R%M]%)
set timeout
set timeoutlen=750
set ttimeout
set ttimeoutlen=0
set undofile
set virtualedit=all
set visualbell
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg
set wildignore+=*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*

colorscheme vividchalk

highlight Comment ctermfg=105 guifg=#8787ff
highlight CursorColumn cterm=NONE ctermbg=237 guibg=#3a3a3a
highlight CursorLine term=underline cterm=underline ctermbg=NONE gui=underline guibg=NONE
highlight LineNr gui=bold guifg=#c6c6c6 guibg=#00005f
highlight LineNr term=reverse cterm=bold ctermfg=251 ctermbg=17
highlight NonText ctermfg=235 guifg=#262626
highlight OverLength ctermbg=234 ctermfg=249
highlight OverLength guibg=#1c1c1c guifg=#b2b2b2
highlight Search ctermfg=222 guifg=#ffdf87
highlight SpecialKey ctermfg=235 guifg=#262626

highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare

highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline guifg=#800000 gui=underline
highlight SpellCap term=underline cterm=underline gui=undercurl
highlight SpellLocal term=underline cterm=underline gui=undercurl
highlight SpellRare term=underline cterm=underline gui=undercurl

match OverLength /\%81v.\+/
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = ","
let maplocalleader = " "
let c_space_errors = 1
let php_sync_method = 1
let $GIT_SSL_NO_VERIFY = 'true'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1
let g:AutoPairsShortcutToggle = '<Leader>ap'
let g:AutoPairsShortcutFastWrap = '<Leader>ae'
let g:AutoPairsShortcutJump = '<Leader>an'
let g:AutoPairsShortcutBackInsert = '<Leader>ab'
let g:less = { 'enabled' : 0, }
let g:localvimrc_persistent = 1
let g:localvimrc_reverse = 1
let g:localvimrc_sandbox = 0
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'php' : 1,
  \}
let g:netrw_silent = 1
let g:NumberToggleTrigger = '<Leader>l'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:sparkupExecuteMapping = '<Leader>se'
let g:sparkupNextMapping = '<Leader>sn'
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wp = 0
let g:syntastic_error_symbol = '⧰'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d -c ~/.eslintrc'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_wordpress_phpcs_standard = 'WordPress-Core'
let g:tagcommands = { 'php': { 'args': '-R' } }
let g:UltiSnipsExpandTrigger = "<M-x>"
let g:UltiSnipsJumpBackwardTrigger = "<M-h>"
let g:UltiSnipsJumpForwardTrigger = "<M-l>"
let g:VCSCommandSplit = 'vertical'
let g:vimpager = {}
let g:wordpress_vim_tags_file_name='../tags'
let g:ycm_filetype_blacklist = { 'markdown': 1, 'text': 1, }

imap <C-c>       <CR><ESC>O

map <Leader>gs   :Gstatus<CR>
map <Leader>gd   :Gdiff<CR>
map <Leader>gc   :Gcommit<CR>
map <Leader>gl   :Glog<CR>
map <Leader>gp   :Gpush<CR>
map <C-PageUp>   :bn<CR>
map <C-PageDown> :bp<CR>
map <Leader><F7> :setlocal spell! spell? spelllang=en_us<CR>

nmap . .'[
nmap <C-i>       i<SPACE><ESC>

noremap n         nzz
noremap N         Nzz
noremap <C-d>     <C-d>zz
noremap <C-u>     <C-u>zz
noremap <Leader>t :enew<CR>

nnoremap <C-e>     3<C-e>
nnoremap <C-p>     :Denite file_rec/async<CR>
nnoremap <C-y>     3<C-y>
nnoremap <Leader>/ :Denite grep:.<CR>
nnoremap <Leader>o :Denite outline<CR>
nnoremap <Leader>q :nohlsearch<CR>
nnoremap H ^
nnoremap J mzJ`z
nnoremap L $
nnoremap Q gq
nnoremap Y y$
nnoremap c "xc
nnoremap gj j
nnoremap gk k
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap { {zz
nnoremap } }zz
nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap : ;

inoremap <C-u>      <C-g>u<C-u>
inoremap <C-x><C-k> <nop>
inoremap <expr>     <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr>     <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

vnoremap y y`]
vnoremap p "_dP`]

xnoremap c "xc

"in case of derp-sudo
cmap w!! w !sudo tee % >/dev/null
command! W w !sudo tee % >/dev/null

" Denite

call denite#custom#option( 'default', 'vertical_preview', 1 )
call denite#custom#option( 'list', 'mode', 'normal' )
call denite#custom#option( 'grep', 'vertical_preview', 1 )

if executable('ag')
  " Use ag in denite grep source.
  call denite#custom#var('grep', 'command',      ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
elseif executable('ack-grep')
  " Use ack in denite grep source.
  call denite#custom#var('grep', 'command', ['ack'])
  call denite#custom#var('grep', 'default_opts',
      \ ['--ackrc', $HOME.'/.ackrc', '-H',
      \  '--nopager', '--nocolor', '--nogroup', '--column'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--match'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

command! -nargs=1 Silent |
  \ execute ':silent !'.<q-args> |
  \ execute ':redraw!'

command! -nargs=* -complete=help Help vertical belowright help <args>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

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

  function! TmuxSharedYank()
    " Send the contents of the 't' register to a temporary file, invoke
    " copy to tmux using load-buffer, and then to xclip
    " FIXME for some reason, the 'tmux load-buffer -' form will hang
    " when used with 'system()' which takes a second argument as stdin.
    let tmpfile = tempname()
    call writefile(split(@t, '\n'), tmpfile, 'b')
    call system('tmux load-buffer '.shellescape(tmpfile).';tmux show-buffer | xclip -i -selection clipboard')
    call delete(tmpfile)
  endfunction

  function! TmuxSharedPaste()
    " put tmux copy buffer into the t register, the mapping will handle
    " pasting into the buffer
    let @t = system('xclip -o -selection clipboard | tmux load-buffer -;tmux show-buffer')
  endfunction

  vnoremap <silent> <ESC>y "ty:call TmuxSharedYank()<cr>
  vnoremap <silent> <ESC>d "td:call TmuxSharedYank()<cr>
  nnoremap <silent> <ESC>p :call TmuxSharedPaste()<cr>"tp
  vnoremap <silent> <ESC>p d:call TmuxSharedPaste()<cr>h"tp
  set clipboard= " Use this or vim will automatically put deleted text into x11 selection('*' register) which breaks the above map

  nnoremap <silent> <C-w>j :silent call TmuxMove('j')<cr>
  nnoremap <silent> <C-w>j :silent call TmuxMove('j')<cr>
  nnoremap <silent> <C-w>k :silent call TmuxMove('k')<cr>
  nnoremap <silent> <C-w>h :silent call TmuxMove('h')<cr>
  nnoremap <silent> <C-w>l :silent call TmuxMove('l')<cr>
  nnoremap <silent> <C-w><down> :silent call TmuxMove('j')<cr>
  nnoremap <silent> <C-w><up> :silent call TmuxMove('k')<cr>
  nnoremap <silent> <C-w><left> :silent call TmuxMove('h')<cr>
  nnoremap <silent> <C-w><right> :silent call TmuxMove('l')<cr>
endif

function! SetDiffColors()
  highlight DiffAdd cterm=bold ctermfg=white ctermbg=DarkGreen
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
  highlight DiffText cterm=bold ctermfg=white ctermbg=DarkRed
endfunction
autocmd FilterWritePre * call SetDiffColors()

augroup OmniFunc
  autocmd!
  autocmd FileType *
    \  if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \  endif
augroup END

augroup FastEscape
  autocmd!
  autocmd InsertEnter * set timeoutlen=0
  autocmd InsertLeave * set timeoutlen=200
augroup END

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
  set cursorcolumn
augroup END

augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  set cursorline
augroup END

augroup ShowListChars
  autocmd!
  autocmd InsertEnter * set nolist
  autocmd InsertLeave * set list
augroup END

augroup cursor_position
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\""                       |
    \ endif                                          |
augroup END

augroup CenteringReadOnly
  autocmd!
  autocmd BufEnter * if !&modifiable | setl scrolloff=999 | endif
augroup END

"autocmd BufRead * try | execute "compiler ".&FileType | catch /./ | endtry

" common FileTypes below
" any project-specific settings should be included in the .lvimrc file placed
" in the root folder of that project

" Apache
autocmd BufNewFile,BufRead,BufEnter httpd.conf setfiletype apache

" C
autocmd FileType c set cinoptions=t0,+4,(4,u4,w1 shiftwidth=8 softtabstop=8
autocmd FileType c set keywordprg=man

" COBOL
autocmd BufNewFile *.cob 0r ~/dotfiles/lang/cobol/header.cob

" Git commit messages
autocmd BufRead,BufNewFile COMMIT_EDITMSG :DiffGitCached

" Golang
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" HTML
autocmd BufNewFile *.html 0r ~/dotfiles/lang/html/index.html

" Lisp
autocmd FileType lisp,scheme,art setlocal equalprg=~/dotfiles/helpers/scmindent.rkt

" Lua
autocmd FileType lua setlocal shiftwidth=4 tabstop=4 softtabstop=4 smarttab
  \ noexpandtab formatoptions=croql

" Markdown
autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown setfiletype markdown

" Mercurial commit messages
autocmd BufNewFile,BufRead,BufEnter msg setfiletype hgcommit
autocmd FileType hgcommit setlocal textwidth=72
autocmd FileType hgcommit match OverLength /\%73v.\+/

" MySQL
autocmd BufNewFile,BufRead,BufEnter *.mysql setfiletype mysql

" Perl
autocmd FileType perl setlocal makeprg=perl keywordprg=perldoc\ -f |
  \ compiler perl

" PHP
autocmd FileType php setlocal keywordprg=pman

" PostgreSQL
autocmd BufNewFile,BufRead,BufEnter *.psql setfiletype postgresql

" Python
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 smarttab
  \ expandtab formatoptions=croql keywordprg=pydoc

" Ruby
autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
autocmd FileType ruby setlocal keywordprg=ri

" tmux
autocmd BufNewFile,BufRead,BufEnter .tmux.*,.tmux.conf* setfiletype tmux

" WordPress
autocmd FileType php.wordpress setlocal shiftwidth=4 tabstop=4 softtabstop=4
  \ smarttab noexpandtab smartindent textwidth=85
autocmd FileType javascript.wordpress setlocal shiftwidth=4 tabstop=4
  \ softtabstop=4 smarttab noexpandtab smartindent textwidth=85
autocmd FileType css.wordpress setlocal shiftwidth=2 tabstop=2 softtabstop=2
  \ smarttab noexpandtab smartindent textwidth=85
autocmd FileType scss.wordpress setlocal shiftwidth=2 tabstop=2 softtabstop=2
  \ smarttab noexpandtab smartindent textwidth=85

autocmd FileType php.wordpress match OverLength /%86v.\+/ |
  \ let b:syntastic_checkers = ['php', 'wordpress/phpcs'] |
autocmd FileType javascript.wordpress match OverLength /%86v.\+/ |
  \ let b:syntastic_checkers = ['eslint']
autocmd FileType css.wordpress match OverLength /%86v.\+/
autocmd FileType scss.wordpress match OverLength /%86v.\+/

" Vim
autocmd FileType vim setlocal keywordprg=:Help
