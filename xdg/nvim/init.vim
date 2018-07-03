if !1 | finish | endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if system('uname -o') =~ '^GNU/'
  let b:make = 'make'
else
  let b:make = 'gmake'
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'equalsraf/neovim-gui-shim'
Plug 'fatih/vim-go', { 'for': [ 'go' ], 'do': ':GoUpdateBinaries' }
Plug 'isRuslan/vim-es6', { 'for': [ 'js', 'jsx', 'javascript.jsx' ] }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'joonty/vdebug'
Plug 'joonty/vim-taggatron'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'reedes/vim-wheel'
Plug 'rkitover/vimpager', { 'do': 'PREFIX=$HOME/.local ' . b:make . ' install' }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vividchalk'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/csv.vim'
Plug 'vim-scripts/DirDiff.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'
call plug#end()

set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=+1
set completeopt=menuone,longest
set copyindent
set diffopt=filler,vertical
set display+=lastline
set encoding=utf-8
set expandtab
set fillchars+=stl:\ ,stlnc:\
set formatoptions=nqr12j
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
set iskeyword+=-
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
set smarttab
set softtabstop=2
set splitbelow
set synmaxcol=512
set tabstop=2
set termguicolors
set textwidth=80
set title
set titlestring=%t%(\ [%R%M]%)
set notimeout
set ttimeout
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
highlight Search ctermfg=222 guifg=#ffdf87
highlight SignColumn ctermfg=232 guifg=#080808
highlight SpecialKey ctermfg=235 guifg=#262626
highlight TermCursor ctermfg=yellow guifg=yellow

highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare

highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline guifg=#800000 gui=underline
highlight SpellCap term=underline cterm=underline gui=undercurl
highlight SpellLocal term=underline cterm=underline gui=undercurl
highlight SpellRare term=underline cterm=underline gui=undercurl

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

let mapleader = ","
let maplocalleader = " "
let c_space_errors = 1
let $GIT_SSL_NO_VERIFY = 'true'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_css_stylelint_use_global = 1
let g:ale_fixers = {
\   'css': ['stylelint'],
\   'html': ['tidy'],
\   'scss': ['stylelint'],
\ }
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {
\   'css': ['stylelint'],
\   'html': ['tidy'],
\   'javascript.jsx': ['eslint'],
\   'scss': ['stylelint'],
\ }
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_open_list = 1
let g:ale_scss_stylelint_use_global = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error = '×'
let g:ale_sign_warning = '⚠'
let g:AutoPairsShortcutToggle = '<Leader>ap'
let g:AutoPairsShortcutFastWrap = '<Leader>ae'
let g:AutoPairsShortcutJump = '<Leader>an'
let g:AutoPairsShortcutBackInsert = '<Leader>ab'
let g:deoplete#enable_at_startup = 1
let g:go_term_mode = "split"
let g:jsx_ext_required = 1
let g:LanguageClient_loggingFile = $HOME . '/lc.log'
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'css' : [ 'vscode-css-languageservice', '--stdio' ],
\   'go' : [ 'go-langserver', '--stdio' ],
\   'html' : [ 'vscode-html-languageservice', '--stdio' ],
\   'javascript' : [ 'javascript-typescript-stdio' ],
\   'jsx' : [ 'javascript-typescript-stdio' ],
\   'javascript.jsx' : [ 'javascript-typescript-stdio' ],
\   'python' : [ 'python-language-server' ],
\   'scss' : [ 'vscode-css-languageservice', '--stdio' ],
\   'typescript' : [ 'javascript-typescript-stdio' ],
\ }
let g:less = { 'enabled' : 0, }
let g:localvimrc_persistent = 1
let g:localvimrc_event = ['BufNewFile', 'BufReadPre', 'BufWinEnter', 'BufEnter']
let g:localvimrc_sandbox = 0
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_list_hide= '.*\.swp$,\.DS_Store,*/tmp/*,*\.so,*\.swp,*\.zip,*\.git,^\.\.\=/\=,*\.log$'
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_silent = 1
let g:netrw_winsize = 25
let g:tagcommand_defaults = {
\   'cmd': 'ctags',
\   'args': '-R -a',
\   'filesappend': '**',
\  }
let g:taggatron_run_in_background = 1
let g:ultisnips_php_scalar_types = 1
let g:UltiSnipsExpandTrigger = "<Leader>u"
let g:UltiSnipsJumpBackwardTrigger = "<C-n>"
let g:UltiSnipsJumpForwardTrigger = "<C-p>"
let g:user_emmet_settings = {
\   'javascript.jsx' : {
\     'extends': 'jsx',
\     'default_attributes': {
\       'label': [{'htmlFor': ''}],
\      }
\    }
\  }
let g:vimpager = {}

map <F7> <Cmd>vsplit %<Cr>
map <C-F7> <Cmd>split %<Cr>

nmap .            .'[
nmap <C-i>        i<Space><Esc>
nmap <C-o>        i<Cr><Esc>
nmap <C-PageDown> <Cmd>bp<Cr>
nmap <C-PageUp>   <Cmd>bn<Cr>
nmap <Leader><F7> <Cmd>setlocal spell! spell? spelllang=en_us<Cr>
nmap <Leader>gb   <Cmd>Gblame<Cr>
nmap <Leader>gc   <Cmd>Gcommit<Cr>
nmap <Leader>gd   <Cmd>Gdiff<Cr>
nmap <Leader>gl   <Cmd>Glog -- %<Cr>
nmap <Leader>gp   <Cmd>Gpush<Cr>
nmap <Leader>gs   <Cmd>Gstatus<Cr>

noremap n         nzz
noremap N         Nzz
noremap <C-d>     <C-d>zz
noremap <C-u>     <C-u>zz
noremap <Leader>l <Cmd>set rnu!<Cr>
noremap <Leader>t <Cmd>enew<Cr>

"imap <Expr> <Cr> (pumvisible() ? "\<C-Y>\<Plug>(expand_or_cr)" : "\<Cr>")
"imap <Expr> <Plug>(expand_or_cr) (cm#completed_is_snippet() ? "\<C-U>" : "\<Cr>")

inoremap <C-u>      <C-g>u<C-u>
inoremap <C-x><C-k> <Nop>
inoremap <Expr> <Tab>   pumvisible() ? '\<C-n>' : '\<Tab>'
inoremap <Expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<S-Tab>'
inoremap <silent> <C-U> <C-R>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<Cr>

nnoremap <C-e>     3<C-e>
nnoremap <C-p>     <Cmd>Denite file_rec<Cr>
nnoremap <C-y>     3<C-y>
nnoremap <Leader>/ <Cmd>Denite grep:.<Cr>
nnoremap <Leader>o <Cmd>Denite outline<Cr>
nnoremap <Leader>q <Cmd>nohlsearch<Cr>
nnoremap H ^
nnoremap J mzJ`z
nnoremap L $
nnoremap Q gq
nnoremap Y y$
nnoremap c "xc
nnoremap gj j
nnoremap gk k
nnoremap <Expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <Expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap { {zz
nnoremap } }zz
nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap : ;
nnoremap _ :Lex<Cr>
nnoremap <silent> <Leader>lc <Cmd>call LanguageClient_contextMenu()<Cr>
nnoremap <silent> <Leader>lk <Cmd>call LanguageClient_textDocument_hover()<Cr>
nnoremap <silent> <Leader>ld <Cmd>call LanguageClient_textDocument_definition()<Cr>
nnoremap <silent> <Leader>lr <Cmd>call LanguageClient_textDocument_references()<Cr>
nnoremap <silent> <F2> <Cmd>call LanguageClient_textDocument_rename()<Cr>

tnoremap <Leader><Esc> <C-\><C-n>

vnoremap y y`]
vnoremap p "_dP`]
vnoremap ; :
vnoremap : ;
vnoremap * y/<C-R>"<Cr>
vnoremap ? y?<C-R>"<Cr>

xnoremap c "xc

" in case of derp-sudo
cmap w!! w !sudo tee % >/dev/null
command! W w !sudo tee % >/dev/null

" Denite
call denite#custom#option( 'default', {
\  'auto_resize': 1,
\  'prompt': '>',
\  'short_source_names': 1,
\  'split': 'vertical',
\  'vertical_preview': 1,
\  'winheight': 999,
\})
call denite#custom#option( 'list', { 'mode': 'normal' } )
call denite#custom#option( 'grep', { 'vertical_preview': 1 } )

if executable('ag')
  " Use ag in denite grep source.
  call denite#custom#var( 'grep', 'command',      ['ag'] )
  call denite#custom#var( 'grep', 'default_opts', ['-i', '--vimgrep'] )
  call denite#custom#var( 'grep', 'recursive_opts', [] )
  call denite#custom#var( 'grep', 'pattern_opt', [] )
  call denite#custom#var( 'grep', 'separator', ['--'] )
  call denite#custom#var( 'grep', 'final_opts', [] )
elseif executable('ack-grep')
  " Use ack in denite grep source.
  call denite#custom#var( 'grep', 'command', ['ack'] )
  call denite#custom#var( 'grep', 'default_opts',
  \     ['--ackrc', $HOME.'/.ackrc', '-H',
  \      '--nopager', '--nocolor', '--nogroup', '--column'] )
  call denite#custom#var( 'grep', 'recursive_opts', [] )
  call denite#custom#var( 'grep', 'pattern_opt', ['--match'] )
  call denite#custom#var( 'grep', 'separator', ['--'] )
  call denite#custom#var( 'grep', 'final_opts', [] )
endif

command! -nargs=1 Silent |
\   execute '<Cmd>silent !'.<q-args> |
\   <Cmd>redraw!<Cr>

command! -nargs=* -complete=help Help vertical belowright help <args>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
  \   | wincmd p | diffthis
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

  "set clipboard=unnamed

  nnoremap <silent> <C-w>j <Cmd>silent call TmuxMove('j')<Cr>
  nnoremap <silent> <C-w>j <Cmd>silent call TmuxMove('j')<Cr>
  nnoremap <silent> <C-w>k <Cmd>silent call TmuxMove('k')<Cr>
  nnoremap <silent> <C-w>h <Cmd>silent call TmuxMove('h')<Cr>
  nnoremap <silent> <C-w>l <Cmd>silent call TmuxMove('l')<Cr>
  nnoremap <silent> <C-w><down> <Cmd>silent call TmuxMove('j')<Cr>
  nnoremap <silent> <C-w><up> <Cmd>silent call TmuxMove('k')<Cr>
  nnoremap <silent> <C-w><left> <Cmd>silent call TmuxMove('h')<Cr>
  nnoremap <silent> <C-w><right> <Cmd>silent call TmuxMove('l')<Cr>
endif

function! SetDiffColors()
  highlight DiffAdd cterm=bold ctermfg=white ctermbg=DarkGreen guifg=#ffffff guibg=#005f00
  highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey guifg=#ffffff guibg=#a9a9a9
  highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue guifg=#ffffff guibg=#00008b
  highlight DiffText cterm=bold ctermfg=white ctermbg=DarkRed guifg=#ffffff guibg=#8b0000
endfunction

augroup FugitiveStuffs
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd QuickFixCmdPost *log* cwindow
  autocmd QuickFixCmdPost *llog* lwindow
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

augroup CloseLocListWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

augroup OmniFunc
  autocmd!
  autocmd FileType *
  \    if &omnifunc == "" |
  \      setlocal omnifunc=syntaxcomplete#Complete |
  \    endif
augroup END

augroup FastEscape
  autocmd!
  autocmd InsertEnter * set timeoutlen=0
  autocmd InsertLeave * set timeoutlen=200
augroup END

augroup TrimWhitespace
  autocmd!
  autocmd BufRead,BufWrite *
  \   if ! &bin |
  \     silent! %s/\s\+$//ge |
  \   endif
augroup END

" update diffs aggressively
" https://groups.google.com/forum/?fromgroups=#!topic/vim_use/ZNZcBAABDgE
augroup AutoDiffUpdate
  autocmd!
  autocmd FilterWritePre * call SetDiffColors()
  autocmd InsertLeave *
  \   if &diff |
  \     diffupdate |
  \     let b:old_changedtick = b:changedtick |
  \   endif
  autocmd CursorHold *
  \   if &diff &&
  \       (!exists('b:old_changedtick') || b:old_changedtick != b:changedtick) |
  \     let b:old_changedtick = b:changedtick | diffupdate |
  \   endif
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

augroup StartupStuffs
  autocmd!
  autocmd BufReadPost *
  \   if line("'\"") > 1 && line("'\"") <= line("$") |
  \     execute "normal! g`\""                       |
  \   endif                                          |
  autocmd BufEnter * if !&modifiable | setl scrolloff=999 | endif
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd BufEnter,BufNew * if &buftype == 'terminal' | :startinsert | endif
  autocmd BufRead * try | execute "compiler ".&FileType | catch /./ | endtry
  autocmd VimResized * execute 'normal! \<C-w>='
  autocmd BufEnter * highlight OverLength ctermbg=234 ctermfg=249 guibg=#1c1c1c guifg=#b2b2b2
  autocmd BufEnter * execute 'match OverLength /\%'. (&textwidth + 1) .'v.*/'
augroup END

" common FileTypes below
" any project-specific settings should be included in the .lvimrc file placed
" in the root folder of that project

" COBOL
autocmd BufNewFile *.cob 0r ~/dotfiles/lang/cobol/header.cob

" HTML
autocmd BufNewFile *.html 0r ~/dotfiles/lang/html/index.html

" LaTeX
autocmd BufNewFile *.tex 0r ~/dotfiles/lang/latex/template.tex

" Lisp
autocmd FileType lisp,scheme,art setlocal equalprg=~/dotfiles/helpers/scmindent.rkt

" Mercurial commit messages
autocmd BufNewFile,BufRead,BufEnter msg setfiletype hgcommit
autocmd FileType hgcommit setlocal textwidth=72

" MySQL
autocmd BufNewFile,BufRead,BufEnter *.mysql setfiletype mysql

" PostgreSQL
autocmd BufNewFile,BufRead,BufEnter *.psql setfiletype postgresql

" Vim
autocmd FileType vim setlocal keywordprg=:Help
