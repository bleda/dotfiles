set nocompatible
filetype off
set cursorline
set cursorcolumn

" essentials
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'
Bundle 'trevordmiller/nova-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'luochen1990/rainbow'
Bundle 'tpope/vim-commentary'
Bundle 'venantius/vim-cljfmt'

" configurations
filetype plugin indent on
set guifont=Andale\ Mono:h14
au VimResized * exe "normal! \<c-w>="
set background=light
set termguicolors
colorscheme nova
syntax enable
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

" 80 characters per line is a must
" autocmd FileType * setlocal colorcolumn=80
" match OverLength /\%80v.\+/
" highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#E35753
autocmd BufEnter * setlocal bufhidden=delete

autocmd QuickFixCmdPost *grep* cwindow

" searching
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" ctrlp configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](bower_components|node_modules|dist|.git|.hg|.svn|.tmp|tmp)$',
\ 'file': '\v\.(exe|o|out|so|dll|wmv|mov|mkv|pdf|jpg|gif|jpeg|png|mp4|zip|7z|tar|gz|bz2|rar|swc|swf|iso|msi|wav|bin|mp3|ttf)$',
\ }
let g:ctrlp_max_depth = 16
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 0

" mappings
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

let g:rainbow_conf = {
\	'guifgs': ['Chartreuse2', 'Violet', 'Yellow1', 'HotPink', 'Aquamarine1'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}
let g:rainbow_active = 1
