"to make the damn thing search like emacs (intelligently)

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>


"LEADER SETTINGS
let mapleader = " "

"REGEX

"eliminates the crazy vim regex syntax
nnoremap / /\v
vnoremap / /\v

"show matching parenthesis
set showmatch

" Splits
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>e <C-w>s<C-w>l
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>

"automatically save the buffer when it looses focuse
:au FocusLost * silent! wa

"FILE LOADING
"use :e to open things
"and note that it by default starts in the directory of the open file
set wildmenu
set wildmode=list:longest,full

"FONT

set guifont=Monaco:h9
set encoding=utf-8


"TAB SETTINGS

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"WRAPPING
set wrap
set linebreak
set nolist

"GRAPHICS SETTINGS

"start scrolling when there are three lines left
set scrolloff=3

"tells vim to display the current editing mode
set showmode

"tells vim to display information about the current command
set showcmd

"no beeping please
set visualbell

"scroll quickly
set ttyfast

"displays line column numbers
set ruler

"set the status line to be always on
set laststatus=2

"engage the relative number ruler
set relativenumber
set number

colorscheme hill_color
set colorcolumn=80

" page up/down
noremap <leader>u <C-f>
noremap <leader>i <C-b>

" undo/redo
noremap U <C-r>

" sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" folding
:set foldmethod=indent

"MISC SETTINGS

"filetype stuff
filetype on
syntax on
" Switch off all indenting except autoindent
set nocindent
set nosmartindent
set indentexpr=
filetype indent off
filetype plugin indent off
set autoindent

"eliminate the security hole
set modelines=0

"eliminate the vi compatibility
set nocompatible

"make backspace work like normal application
set backspace=indent,eol,start

"disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

noremap <leader>a :CtrlPBuffer<cr> 
vnoremap <leader>a :CtrlPBuffer<cr>
noremap <leader>f :CtrlP<cr>
vnoremap <leader>f :CtrlP<cr>
let g:ctrlp_max_depth = 10
let g:ctrlp_max_files = 10000
"make it so ctrlp doesn't jump
let g:ctrlp_switch_buffer = 0
"make it so that ctrlp scans hidden files
let g:ctrlp_show_hidden = 1
" Look for .git to indicate root. If no root, use current dir
let g:ctrlp_working_path_mode = 'ra'
" Exclude files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Allow interemdiate roots for monorepo
let g:ctrlp_root_markers = ['.root']
"set ctrl-p to ignore the right things
let g:ctrlp_custom_ignore = {
            \ 'dir': '\vbuild|installations|node_modules|dist|\.cache|[\/]\.(git|hg|svn)$',
            \ 'file': '\v\~$|\#$|\.(exe|so|dll|class|aux|log|o|cmake|make|internal|includecache|swp)$',
            \ }
"good information: http://www.reddit.com/r/vim/comments/1a7nmw/ctrlp_vs_e_and_b/


" clang-format
let g:clang_format#command = 'clang-format-18'
augroup ClangFormatSettings
  autocmd!
  " map to <Leader>cf in C++ code
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
  " if you install vim-operator-user
  autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
augroup END
