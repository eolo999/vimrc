" Edoardo Batini <eodbat@gmail.com> .vimrc file.
" Sat Sep 25 17:39:35 CEST 2010

"" General settings
" Use Vim settings
set nocompatible
" fast terminal
" Use pathogen for plugin organization
call pathogen#runtime_append_all_bundles()
" Fast terminal
set ttyfast
" Enable mouse
set mouse=a
" set virtualedit
" backup files out of the way
set nobackup
set backupdir=~/.vim/backup/
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Indentations and tabs
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set textwidth=78
" folding
set foldmethod=manual
"set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

"" Appearance
syntax enable
colorscheme desert
"colorscheme xterm16
"set t_Co=256
"colorscheme xoria256
" Cursorline override
"highlight CursorLine cterm=none ctermbg=0
"set cursorline
" status line
set laststatus=2
" set statusline=%F%m%r%h%w\ Format=%{&ff}\ Type=%y\ [Pos=%l,%v][%p%%]\ [Len=%L]
set statusline=%f\ %m\ %r\ Format=%{&ff}\ Type=%y\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n
" relative line numbers
set relativenumber
" Show special chars for tab & eol
"set list
"set listchars=tab:▸\ ,eol:¬

"" Searching
"" =========
" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
set incsearch
" highlight last used search pattern.
set hlsearch

"" Language spell and dictionaries
"" ===============================
set spelllang=en,it
set spellsuggest=5
" Use English dictionary for word completion
set dictionary+=/usr/share/dict/british-english

"" Unclassified
"" ============
set hidden
set showmode
" Show (partial) command
set showcmd
" Show matching brackets
set showmatch
set wildmenu
set history=150

"" Commands
"" ========
command! Q q
command! W w

"" Keyboard mappings
"" =================
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
cnoremap <C-A> <Home>
" back one character
cnoremap <C-B> <Left>
" delete character under cursor
cnoremap <C-D> <Del>
" end of line
cnoremap <C-E> <End>
" forward one character
cnoremap <C-F> <Right>
" Map python omnifunc to ctrl-space
set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>
" Tab movement left/right
map <C-Right> gt
map <C-Left> gT
" F-Keys mapping
imap <F1> <ESC>
imap <F2> <C-R>="Edoardo Batini <eodbat@gmail.com>"<cr>
imap <F3> <C-R>="#!/usr/bin/env python"<cr>
imap <F4> <C-R>="if __name__ == '__main__':"<cr>
imap <F6> <C-R>=strftime("%d-%m-%Y")<cr>
map  <F10> :!gcc % && ./a.out<cr>
" Leader shortcuts
let mapleader = ","
  " Window splits
  nnoremap <leader>h <C-w>s
  nnoremap <leader>v <C-w>v
map <leader>, :b#<cr>
map <leader>t :tabe 
map <leader>z :sh<cr>
" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<cr>
    " Insert filename
nnoremap <leader>f i<C-R>=expand("%:t:r")<cr><ESC>
nnoremap <leader>F i<C-R>=expand("%:t")<cr><ESC>
    " reStructuredText title/section/subsection/etc. shortcuts
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 yypVr'
nnoremap <leader>4 yypVr`
vmap <silent> <leader>b :call BulletList()<cr>
    " remove highlighted search
nnoremap <silent> <leader><space> :let @/=''<cr>
    " toggle status line
nnoremap <silent> <leader>l  :call ToggleStatusLine()<cr>
    " toggle spell check
nnoremap <silent> <leader>s  :set spell!<cr>
    " toggle line numbers
nnoremap <silent> <leader>n :set nu!<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of vimrc
map <leader>e :e! ~/.vimrc<cr>
"" Filetypes
"" =========
filetype plugin indent on
autocmd BufRead,BufNewFile *.log set filetype=syslog
autocmd BufRead,BufNewFile *.pde set filetype=processing
autocmd BufRead,BufNewFile *.txt set filetype=rst
autocmd BufRead,BufNewFile *.pde setlocal ft=arduino

"" Templates
"" =========
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

"" Functions
"" =========
function! EnableSaveOnTabChange()
    autocmd TabLeave * w
endfunction
function! SaveOnTabChange()
    if modified
        :w
    endif
endfunction
" Toggle Status Line
function! ToggleStatusLine()
    if &laststatus != 2
        set laststatus=2
    else
        set laststatus=0
    endif
endfunction
" Bullet List
function! BulletList()
    let lineno = line(".")
    call setline(lineno, "* " . getline(lineno))
endfunction

"" Plugins
