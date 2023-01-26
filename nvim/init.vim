"*****************************************************************************
"" Packages
"*****************************************************************************
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'sainnhe/sonokai'
Plug 'pantharshit00/vim-prisma'
call plug#end()



"*****************************************************************************
"" Mappings
"*****************************************************************************
let mapleader = ","
let g:mapleader = ","
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>t :sp<bar>term<cr><c-w>J:resize10<cr>


"*****************************************************************************
"" UI
"*****************************************************************************
if (has("termguicolors"))
  set termguicolors
endif

set guifont=Andale\ Mono:h14
set background=dark
colorscheme sonokai
let g:sonokai_style = 'andromeda'

" coc.nvim colors
" highlight CocErrorHighlight ctermbg=109 guibg=#13354A
" highlight CocErrorFloat ctermfg=109 guifg=#F2C38F


"*****************************************************************************
"" Misc
"*****************************************************************************
au VimResized * exe "normal! \<c-w>="
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
set shell=/bin/zsh
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
set colorcolumn=96
highlight ColorColumn ctermbg=0 guibg=#DF8C8C
autocmd BufEnter * setlocal bufhidden=delete
autocmd QuickFixCmdPost *grep* cwindow
set clipboard=unnamed
set mouse=a
au TermOpen * setlocal nonumber norelativenumber



"*****************************************************************************
"" FZF
"*****************************************************************************
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/*' -prune -o -path 'server/dist' -prune -o -path 'docs/*' -prune -o -path 'target/*' -prune -o -path 'dist/*' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" let $FZF_DEFAULT_COMMAND = 'find . \( -name node_modules -o -name .git \) -prune -o -print'


"*****************************************************************************
"" TS Development
"*****************************************************************************
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prisma']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
