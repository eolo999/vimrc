" Edoardo Batini <eodbat@gmail.com> .vimrc file.
"
" Use Vim settings, rather then Vi settings (much better!).
set nocompatible
" backup files out of the way
set nobackup
set backupdir=~/.vim/backup/
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set expandtab
set smarttab
set sw=4
set ts=4
set autoindent
set history=150
set spelllang=en,it
set spellsuggest=9
set ruler
set number
" Show (partial) command
set showcmd
" Show matching brackets
set showmatch
" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
set incsearch
set wildmenu
" Show special chars for tab & eol
"set list
"set listchars=tab:▸\ ,eol:¬
" Enable mouse
set mouse=a
" Switch syntax highlighting on
" Also switch on highlighting the last used search pattern.
syntax enable
set hlsearch
" always show status line at startup
set laststatus=2
set statusline=%F%m%r%h%w\ FORMAT=%{&ff}\ TYPE=%Y\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" Use English dictionary for word completion
set dictionary+=/usr/share/dict/british-english-huge
filetype plugin indent on
colorscheme tango

let g:SuperTabSetDefaultCompletionType = "context"
let g:SuperTabRetainCompletionDuration = "insert"

"" Keyboard mappings
"" =================

nmap <space> <PageDown>
map <C-Right> gt
map <C-Left> gT

" F-Keys mapping
imap <F2> <C-R>="Edoardo Batini <eodbat@gmail.com>"<CR>
imap <F3> <C-R>="#!/usr/bin/env python"<CR>
imap <F4> <C-R>="if __name__ == '__main__':"<CR>
imap <F6> <C-R>=strftime("%d-%m-%Y")<CR>
map  <F10> :!gcc % && ./a.out<CR>

" Leader shortcuts
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
nnoremap <silent> <leader>s  :call ToggleStatusLine()<cr>
    " toggle spell check
nnoremap <silent> <leader>c  :set spell!<cr>

"" Filetypes
"" =========

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

" Clever Tab Function
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
    endif
endfunction

" Bullet List
function! BulletList()
    let lineno = line(".")
    call setline(lineno, "* " . getline(lineno))
endfunction

" Project management
" ==================

" Load session file if available
" removed becouse doesn't check for file existence and raise an error while
" opening vim
" silent source! Session.vim

