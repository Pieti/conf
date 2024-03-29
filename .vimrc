" ===============================================
" # GENERAL CONFIG
" ===============================================

" Fish doesn't play nice with vim
set shell=/bin/bash

" ====== VIM SPECIFIC CONFIG =====

" Set vim config similar to nvim defaults
" based on tpope/vim-sensible
if !has('nvim')
    " Enable filetype detection
    if has('autocmd')
        filetype plugin indent on
    endif
    if has('syntax') && !exists('g:syntax_on')
        syntax enable
    endif

    set autoindent
    set autoread
    set background=dark
    set backspace=indent,eol,start
    set belloff=all
    set complete-=i                     " no included files in complete
    set display+="lastline,msgsep"
    set encoding=utf-8
    set history=10000
    set hlsearch
    set incsearch
    set laststatus=2
    set nocompatible
    set nolangremap
    set nrformats-=octal
    set sessionoptions-=options
    set showcmd                         " display incomplete commands
    set sidescroll=1
    set smarttab
    set tabpagemax=50
    set tags=./tags;,tags
    set ttimeout
    set ttimeoutlen=50
    set ttyfast
    set ruler                           " show the cursor position at all times
    set wildmenu
    set wildoptions="pum,tagfile"

    if v:version > 703 || v:version == 703 && has("patch541")
        set formatoptions+=j            " delete comment character when joining commented lines
    endif

    if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
        set shell=/usr/bin/env\ bash
    endif

    if !empty(&viminfo)
        set viminfo^=!
    endif


    " Allow color schemes to do bright colors without forcing bold.
    if &t_Co == 8 && $TERM !~# '^Eterm'
        set t_Co=16
    endif

    " Load matchit.vim, but only if the user hasn't installed a newer version.
    if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
        runtime! macros/matchit.vim
    endif
endif

" ===== SHARED CONFIG =====

set nobackup
set nowritebackup
set noswapfile
set autowrite                       " autowrite before running commands
set nomodeline                      " disable modelines
set ignorecase                      " ignore case when searching
set smartcase                       " unless the search contains a capital letter
set cmdheight=2                     " git a bit more room for commands
set updatetime=300                  " avoid delays by using shorter updatetime
set scrolloff=5                     " scroll the screen before reaching vertical edge
set sidescrolloff=5                 " scroll the screen before reaching horizontal edge
set number                          " show line numbers
set relativenumber                  " ...relative to the cursor
set viewoptions-=options

" indentation, a tab is four spaces wide
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab                       " convert tabs to spaces

" display extra whitespace
set list listchars="tab:»·,trail:·,nbsp:·"

" user one space, not two, after punctuation
set nojoinspaces

" Enable mouse in terminals
set mouse=a

" Open new split panes to right and bottom
set splitbelow
set splitright

set lazyredraw

" Always use vertical diffs
set diffopt+=vertical


" === VARIABLES ===

" Enable async only configuration
let g:has_async = v:version >=800 || has('nvim')

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" === KEY MAPPING ===

" Space is a handy leader
let mapleader = "\<Space>"

" Unmap some thing that I might hit accidentally
nmap Q <nop>
nmap q: <nop>
map <F1> <Esc>
imap <F1> <Esc>

if empty(mapcheck('<C-U>', 'i'))
    inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
    inoremap <C-W> <C-G>u<C-W>
endif

" Move lines around
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" Quick save
noremap <Leader>w :w<CR>

" Clone paragraph
noremap cp yap<S}>p

" Align paragraph
noremap <leader>a = ip

" Fast quit
noremap <leader>q :q<cr>

" Fast save
noremap <leader>w :w<cr>

" CTRL+/ to stop search highlighting
" CTRL+'/' seems to produce an undescore
nnoremap <C-_> :nohlsearch<cr>

" Automatically jump to the end of a paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Splitting similar to tmux config
noremap <leader><C-l> <C-w>v<CR>
noremap <leader><C-j> <C-w>s<CR>

" Tabs similar to tmux with leader
noremap <leader><C-c> :tabnew<CR>
noremap <leader><C-x> :tabc<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 0gt

" Clipboard setup
if has('clipboard')
    set clipboard+=unnamedplus
    nnoremap x "_x
    nnoremap X "_X
endif
