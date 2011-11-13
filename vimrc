" Edoardo Batini <eodbat@gmail.com> .vimrc file.
" Sat Sep 25 17:39:35 CEST 2010

"" General settings
set nocompatible
" Use pathogen for plugin organization
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
"set cc=+1
" folding
set foldmethod=indent
set foldlevel=99
"set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

"" Appearance
syntax enable
set t_Co=256
set background=dark
" colorscheme solarized
" colorscheme desert256
"highlight LineNr cterm=NONE ctermfg=cyan ctermbg=Black
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
"colorscheme xterm16
"colorscheme xoria256
" Cursorline override
"highlight CursorLine cterm=none ctermbg=0
"set cursorline
" status line
set laststatus=2
" set statusline=%F%m%r%h%w\ Format=%{&ff}\ Type=%y\ [Pos=%l,%v][%p%%]\ [Len=%L]
set statusline=%f\ %m\ %r\ Format=%{&ff}\ Type=%y\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ %{fugitive#statusline()}
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" relative line numbers
" set relativenumber
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
set hidden
set showmode
" Show (partial) command
set showcmd
" Show matching brackets
set showmatch
set wildmenu
set history=500

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

imap <F1> <ESC>
imap <F2> <C-R>="Edoardo Batini <eodbat@gmail.com>"<cr>
imap <F3> <C-R>="#!/usr/bin/env python"<cr>
imap <F4> <C-R>="if __name__ == '__main__':"<cr>
call togglebg#map("<F5>")
imap <F7> <C-R>=strftime("%d-%m-%Y")<cr>
map  <F9> :!python %<cr>
map  <F10> :!gcc % && ./a.out<cr>

" Leader shortcuts
let mapleader = ","
" Window splits
nnoremap <leader>h <C-w>s
nnoremap <leader>v <C-w>v
" Open path under cursor
nnoremap gF :e <cfile><cr>
" go to previous buffer
map <leader>, :b#<cr>
" open a shell
map <leader>z :sh<cr>
" remove trailing whitespaces
nnoremap <leader>t :%s/\s\+$//<cr>
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

" Fast editing of vimrc
map <leader>e :e! ~/.vimrc<cr>

" Rope python
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

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
autocmd BufRead,BufNewFile *.log set filetype=syslog
autocmd BufRead,BufNewFile *.pde set filetype=processing
autocmd BufRead,BufNewFile *.txt set filetype=rst
autocmd BufRead,BufNewFile *.pde setlocal ft=arduino
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2

"" Templates
"" =========
autocmd BufNewFile *.html,*.py,*.erl silent! 0r ~/.vim/templates/%:e.tpl

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

" Show syntax highlighting groups for word under cursor
nmap <leader>zz :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"" Plugins
" pyflakes
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<F6>'
" supertab
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview

