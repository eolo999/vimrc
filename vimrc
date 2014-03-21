" Edoardo Batini <eodbat@gmail.com> .vimrc file.
" Sat Jan 25 23:52:38 CET 2014

filetype off
" Use Vundle for plugin organization
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'bling/vim-airline'
Bundle 'davidhalter/jedi'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'jamessan/vim-gnupg'
Bundle 'mattn/emmet-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mitsuhiko/vim-jinja'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vinegar'
Bundle 'vim-scripts/pep8'

filetype plugin indent on
set nocompatible

set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set laststatus=2

" set undofile
" set undoreload=10000

set list
set listchars=tab:⇒\ ,eol:¬
set lazyredraw

set showmatch
set matchtime=3

set splitbelow
set splitright

set scrolloff=3

set wildmenu

set cursorline
set colorcolumn=80

" Enable mouse
set mouse=a

" backup files out of the way
set nobackup
set backupdir=~/.vim/backup/
set noswapfile

" Tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

"" Appearance
syntax on
set t_Co=256
colorscheme jellybeans

"" Searching
"" =========
set ignorecase
set smartcase
set hlsearch
set incsearch


"" Language spell and dictionaries
"" ===============================
set spelllang=en,it
set spellsuggest=5
" Use English dictionary for word completion
set dictionary+=/usr/share/dict/british-english

set virtualedit=block
set history=1000
set foldmethod=marker

"" Commands
"" ========
command! Q q
command! W w

"" Keyboard mappings
"" =================

" Dogmatic removal of arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Folding
nnoremap <space> zA

" ESC from insert mode
inoremap jk <ESC>
inoremap jj <ESC>

inoremap <F2> <C-R>="Edoardo Batini <eodbat@gmail.com>"<cr>
nnoremap <F4> Oimport ipdb; ipdb.set_trace()
inoremap <F4> import ipdb; ipdb.set_trace()
nnoremap <F5> Ovar_dump($var);exit;<esc>3b
inoremap <F5> var_dump($var);exit;<esc>3b

" Leader shortcuts
let mapleader = ","
let maplocalleader = '\'
" Window splits
nnoremap <leader>h <C-w>s
nnoremap <leader>v <C-w>v

" go to previous buffer
map <leader>, :b#<cr>
" open netrw file browser in current directory
map <leader>. :e .<cr>

" remove trailing whitespaces
nnoremap <leader>t :%s/\s\+$//<cr>
" remove trailing ^M
map <leader>m :%s/<C-v><C-m>//g<cr>

" Insert filename
nnoremap <leader>f i<C-R>=expand("%:t:r")<cr><ESC>
nnoremap <leader>F i<C-R>=expand("%:t")<cr><ESC>

" reStructuredText title/section/subsection/etc. shortcuts
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 yypVr'
nnoremap <leader>4 yypVr`
nnoremap <leader>5 bi**<ESC>ea**<ESC>
vmap <silent> <leader>b :call BulletList()<cr>

" remove highlighted search
nnoremap <silent> <leader><space> :nohlsearch<cr>
" toggle spell check
nnoremap <silent> <leader>s :set spell!<cr>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :wq<cr>

" Fast editing of vimrc
map <leader>e :e! ~/.vimrc<cr>

"" Abbreviations
"" =============
" Insert UTC date
iabbrev dutc <esc>:r!date -u<cr>i<backspace><esc>A
" Insert erota name and email
iabbrev edorota Edoardo Batini <edoardo@eRota.net>

" Return to last editing line when reopenining a file
autocmd BufReadPost *
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \       execute 'normal! g`"zvzz' |
    \   endif

"" Filetypes
"" =========
autocmd FileType html,javascript,htmldjango,jinja setlocal sw=2 ts=2 sts=2
autocmd FileType php setlocal noexpandtab
autocmd FileType python setlocal foldmethod=indent

autocmd BufEnter *html :syntax sync fromstart

autocmd BufRead,BufNewFile *.jinja set filetype=jinja
autocmd BufRead,BufNewFile *.txt set filetype=rst
autocmd BufRead,BufNewFile *.gss set filetype=css

autocmd BufWritePost *.gss call CompileGss()

"" Templates
"" =========
autocmd BufNewFile *.py,*.erl silent! 0r ~/.vim/templates/%:e.tpl


"" Functions
"" =========
function! CompileGss()
    let current_filename = expand("%")
    let output_filename = expand("%:r") . ".css"
    let command = "!java -jar ~/repos/personal/google-closure-tools/closure-stylesheets/build/closure-stylesheets.jar --pretty-print "
    silent execute command . current_filename . " > " output_filename
endfunction


" Syntastic Python Checkers
let g:syntastic_python_checkers = ['pyflakes']
" pyflakes
let g:pyflakes_use_quickfix = 0


"" New things to remember
" :jumps -> Ctrl-O Ctrl-I
" :marks Backtick and single-quote
" O and o in Visual Blocks
" ~ to change lower/upper case under cursor

"" Things to watch later
" console-menus
