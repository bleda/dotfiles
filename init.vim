"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/emirbostan/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/emirbostan/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/emirbostan/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

call dein#add('tpope/vim-fugitive')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-commentary')
call dein#add('junegunn/fzf', { 'build': './install', 'rtp': '/opt/homebrew/opt/fzf' })
call dein#add('junegunn/fzf.vim')
call dein#add('tpope/vim-rails')

set guifont=Andale\ Mono:h14
au VimResized * exe "normal! \<c-w>="
set background=light
set termguicolors
set grepprg=grep
set laststatus=2
set number
set hidden
set clipboard=unnamed
set backspace=indent,eol,start
set directory=/tmp//
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac
set nowrap
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set novisualbell
set noerrorbells
set shell=/bin/zsh\ -l
" set list listchars=tab:»\ ,trail:~
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab
set autoindent
set copyindent
set foldmethod=indent
set foldlevel=99
cmap w!! w !sudo tee % >/dev/null
set autoread
au CursorHold,CursorHoldI,CursorMoved,FocusGained,BufEnter * checktime
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#E35753
autocmd BufEnter * setlocal bufhidden=delete

autocmd QuickFixCmdPost *grep* cwindow
nnoremap <silent> <Leader>/ :nohlsearch<CR>

nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
let mapleader = ","
let g:mapleader = ","
nnoremap <silent> <leader>p "0p

set clipboard=unnamed

:tnoremap <C-w>h <C-\><C-n><C-w>h
:tnoremap <C-w>j <C-\><C-n><C-w>j
:tnoremap <C-w>k <C-\><C-n><C-w>k
:tnoremap <C-w>l <C-\><C-n><C-w>l
:tnoremap <Esc> <C-\><C-n>

set mouse=a
au TermOpen * setlocal nonumber norelativenumber

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr> augroup fzf autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
