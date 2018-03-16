set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set noswapfile
set shortmess+=I
set hidden
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set complete=.,w,b,u,t,i,k
set completeopt=menuone,preview,noinsert,noselect
set omnifunc=syntaxcomplete#Complete
set complete-=i
set autoindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=0
set softtabstop=-1
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set incsearch
set hlsearch|nohlsearch
set wildmenu
set scrolloff=1
set sidescroll=1
set sidescrolloff=5
set display+=lastline
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
if &shell =~# "fish$" && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/sh
endif
set autoread
if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif
set switchbuf=useopen
set mouse=a
set number 
set clipboard^=unnamed,unnamedplus
set updatetime=750
set laststatus=2
set statusline=
let &statusline .= '%<%f'                " Filename, truncate right
let &statusline .= ' %h%m%r'             " [Help] [modified] [read-only]
let &statusline .= '%='                  " Right-align from here on
let &statusline .= '%y'
let &statusline .= ' [line %l of %L]'    " current line, total lines
let &statusline .= ' [col %v]'           " column
let &statusline .= ' [0x%B]'             " Byte value under cursor
let &rulerformat = '%l/%L %c 0x%B'
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•
set wildmode=longest:full,full
