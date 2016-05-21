set encoding=utf-8
set nocompatible
filetype off
set cursorcolumn
set cursorline

" essentials
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'
Bundle 'powerline/powerline'
Bundle 'christoomey/vim-tmux-navigator'

" syntaxes
Bundle 'leshill/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-ruby/vim-ruby'
Bundle 'fatih/vim-go'

" color schemes
Bundle 'lsdr/monokai'
Bundle 'tomasr/molokai'


" configurations
filetype plugin indent on
set background=dark
set guifont=Andale\ Mono:h13
au VimResized * exe "normal! \<c-w>="
if !has("gui_running")
    let g:rehash256=1
    colorscheme molokai
else
    colorscheme monokai
endif
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
set list listchars=tab:»\ ,trail:~
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
autocmd FileType * setlocal colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
autocmd BufEnter * setlocal bufhidden=delete

autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType crontab setlocal backupcopy=yes

" html configurations
au BufNewFile,BufReadPost *.html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.less setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" ruby configurations
"""""""""""""""""""""
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" jade configurations
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" coffeescript configurations
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" javascript configurations
autocmd FileType javascript  setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" golang config
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
autocmd FileType go set tabstop=8 softtabstop=0 noexpandtab shiftwidth=8

" searching
nnoremap <Leader>gg :Ggrep -i <cword><CR>
nnoremap <leader>g :Ggrep ''<Left>
nnoremap <silent> <leader>/ :nohlsearch<CR>

" ctrlp configurations
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](bower_components|node_modules|dist|.git|.hg|.svn|.tmp)$',
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

