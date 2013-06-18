" Edoardo Batini <eodbat@gmail.com> .vimrc file.
" Sat Apr 13 13:59:40 UTC 2013

" Use pathogen for plugin organization
execute pathogen#infect()

set nocompatible

" Basic options
if has("gui_running")
    set guifont=Ubuntu\ Mono\ 12
endif

set encoding=utf-8
" Fast terminal
set ttyfast
" Enable mouse
set mouse=a
" backup files out of the way
set nobackup
set backupdir=~/.vim/backup/
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Indentations and tabs
set autoindent
set shiftwidth=4
set softtabstop=4
set ts=4
set expandtab
set smarttab
" set textwidth=78
syntax on
"" Appearance
set t_Co=256
" set background=dark
" colorscheme molokai
colorscheme jellybeans
" status line
set laststatus=2
" set statusline=%F%m%r%h%w\ Format=%{&ff}\ Type=%y\ [Pos=%l,%v][%p%%]\ [Len=%L]
" relative line numbers
" set relativenumber
set number
" Show special chars for tab & eol
set list
set listchars=tab:⇒\ ,eol:¬

"" Searching
"" =========
" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
" highlight last used search pattern.
set hlsearch
set incsearch

"" highlight 80th column
set colorcolumn=80

"" Language spell and dictionaries
"" ===============================
set spelllang=en,it
set spellsuggest=5
" Use English dictionary for word completion
set dictionary+=/usr/share/dict/british-english

"" Unclassified
"" ============
" set visualbell
set virtualedit=block
set cursorline
set hidden
set showmode
" Show (partial) command
set showcmd
" Show matching brackets
set showmatch
set wildmenu
set history=1000
" set undofile
" set undoreload=10000
set lazyredraw

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

inoremap jk <ESC>
inoremap jj <ESC>
imap <F2> <C-R>="Edoardo Batini <eodbat@gmail.com>"<cr>
imap <F3> <C-R>="#!/usr/bin/env python"<cr>
nnoremap <F4> Oimport ipdb; ipdb.set_trace()
imap <F7> <C-R>=strftime("%d-%m-%Y")<cr>
map  <F9> :!python %<cr>
map  <F10> :!gcc % && ./a.out<cr>

" Leader shortcuts
let mapleader = ","
let maplocalleader = '\'
" Window splits
nnoremap <leader>h <C-w>s
nnoremap <leader>v <C-w>v
" Open path under cursor
nnoremap gF :e <cfile><cr>
" go to previous buffer
map <leader>, :b#<cr>
" open netrw file browser in current directory
map <leader>. :e .<cr>
" open a shell
map <leader>z :sh<cr>
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
nnoremap <silent> <leader><space> :let @/=''<cr>
" toggle status line
nnoremap <silent> <leader>l :call ToggleStatusLine()<cr>
" toggle spell check
nnoremap <silent> <leader>s :set spell!<cr>
" toggle line numbers
nnoremap <silent> <leader>n :set nu!<cr>

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

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\   if line("'\"") > 1 && line("'\"") <= line("$") |
\       exe "normal! g`\"" |
\   endif

"" Filetypes
"" =========
filetype plugin indent on
autocmd BufRead,BufNewFile *.jinja set filetype=jinja
autocmd BufRead,BufNewFile *.log set filetype=syslog
autocmd BufRead,BufNewFile *.txt set filetype=rst
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2
autocmd BufEnter *html :syntax sync fromstart
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

"" Plugins
" molokai colorscheme
let g:molokai_original = 1
" pyflakes
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<F6>'
" supertab
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview
"
"let g:Powerline_symbols = 'default'
"set rtp+=~/.vim/bundle/vim-powerline/powerline/bindings/vim
"
