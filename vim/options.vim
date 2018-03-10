filetype plugin indent on
syntax enable
set backspace=indent,eol,start
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
set laststatus=2
set wildmenu
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set encoding=utf-8
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
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
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
set switchbuf=useopen
set mouse=a
set clipboard^=unnamed
set updatetime=750
set statusline=
let &stl .= '%<%f'                " Filename, truncate right
let &stl .= ' %h%m%r'             " [Help] [modified] [read-only]
let &stl .= '%='                  " Right-align from here on
let &stl .= ' [line %l of %L]'    " current line, total lines
let &stl .= ' [col %v]'           " column
let &stl .= ' [0x%B]'             " Byte value under cursor
let &rulerformat = '%l/%L %c 0x%B'
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•
set wildmode=longest:full,full
