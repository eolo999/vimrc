" Edoardo Batini <eodbat@gmail.com> .vimrc file.
" Sat Sep 25 17:39:35 CEST 2010
"
" Use Vim settings
set nocompatible

" fast terminal
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
set sts=4
set expandtab
set smarttab


"" Appearance
"" ==========
syntax enable
colorscheme tango
" Cursorline override
hi CursorLine term=none cterm=none ctermbg=0
set cursorline
" status line
set laststatus=2
set statusline=%F%m%r%h%w\ FORMAT=%{&ff}\ TYPE=%Y\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" line numbers
set number
" Show special chars for tab & eol
set list
set listchars=tab:▸\ ,eol:¬

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
" Show (partial) command
set showcmd
" Show matching brackets
set showmatch
set wildmenu
set history=150

"" Commands
"" ========
command Q q
command W w

"" Keyboard mappings
"" =================
nmap <space> <PageDown>
map <C-Right> gt
map <C-Left> gT
" F-Keys mapping
imap <F1> <ESC>
imap <F2> <C-R>="Edoardo Batini <eodbat@gmail.com>"<CR>
imap <F3> <C-R>="#!/usr/bin/env python"<CR>
imap <F4> <C-R>="if __name__ == '__main__':"<CR>
imap <F6> <C-R>=strftime("%d-%m-%Y")<CR>
map  <F10> :!gcc % && ./a.out<CR>
" Leader shortcuts
map <leader>t :tabe 
    " Insert filename
inoremap <leader>f <C-R>=expand("%:t")<CR>
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

"" Filetypes
"" =========

filetype plugin indent on
autocmd BufRead,BufNewFile *.log set filetype=syslog
autocmd BufRead,BufNewFile *.txt set filetype=rst
autocmd filetype lisp,scheme,art setlocal equalprg=lispindent.lisp 

" Templates
" =========
autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" Functions
" =========

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
"" =======
" Supertab plugin configuration
" does it really changes things?
let g:SuperTabSetDefaultCompletionType = "context"
let g:SuperTabRetainCompletionDuration = "insert"

