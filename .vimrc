set encoding=utf-8
set nocompatible " be iMproved
filetype off " required!

set cursorcolumn
set cursorline

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" VCS
Bundle 'tpope/vim-fugitive'
" System
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-vividchalk'

" Syntaxes and such.
Bundle 'leshill/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'vim-ruby/vim-ruby'

" Fun, but not useful
Bundle 'powerline/powerline'
Bundle 'lsdr/monokai'
Bundle 'morhetz/gruvbox'
Bundle 'tomasr/molokai'

filetype plugin indent on " required!

" Configurations
""""""""""""""""
set background=dark

" OS specific stuff
""""""""""""""""
if has("win32")
    set guifont=Consolas
else
    set guifont=Andale\ Mono:h13
endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

if !has("gui_running")
    let g:rehash256=1
    colorscheme molokai
else
    colorscheme monokai
endif

" Basic
syntax enable
set grepprg=grep
set laststatus=2 " show status line
set number " always show line numbers
set hidden " Allow un-saved buffers in background
set clipboard=unnamed " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set directory=/tmp// " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac "Default file types
set nowrap " don't wrap lines
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set title " change the terminal's title
set novisualbell " don't beep
set noerrorbells " don't beep
set shell=/bin/zsh\ -l

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:~

" Default Tabs & spaces
set tabstop=4 " a tab is four spaces
set shiftwidth=4 " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab " insert tabs on the start of a line according to
" shiftwidth, not tabstop
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting

" General Code Folding
""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v

" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
autocmd BufEnter * setlocal bufhidden=delete
" autocmd BufReadPost fugitive://* set bufhidden=delete

autocmd QuickFixCmdPost *grep* cwindow

" Crontab auto-commands
"""""""""""""""""""""""
autocmd FileType crontab setlocal backupcopy=yes
" HTML configurations
"""""""""""""""""""""
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType less setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" Ruby configurations
"""""""""""""""""""""
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Jade configurations
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.js setlocal shiftwidth=4 expandtab

" Custom mappings
""""""""""""""""""

" Change leader
let mapleader = ","
let g:mapleader = ","

" Genral search
nnoremap <Leader>gg :Ggrep -i <cword><CR>
nnoremap <leader>g :Ggrep ''<Left>

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" quickfix close
" nnoremap <silent> <esc> :ccl<CR>

" Plugin configurations
"""""""""""""""""""""""
" crtl-p
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

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <silent> <leader>p "0p
