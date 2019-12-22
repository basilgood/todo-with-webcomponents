scriptencoding utf-8

set path=.,**
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set fileformats=unix,dos
set notermguicolors
set number
set mouse=a
set cursorline
set lazyredraw
set shortmess+=aoOtTIc
set noerrorbells
set novisualbell
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set virtualedit=block
set tabline=%!functions#tabline()
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt+=menuone,noselect
set completeopt-=preview
set pumheight=12
set gdefault
set hlsearch|nohlsearch
set nostartofline
set sidescrolloff=5
set sidescroll=1
set diffopt+=context:3,indent-heuristic,algorithm:patience
set inccommand=nosplit
set timeoutlen=3000
set updatetime=100
set wildmode=longest:full,full
set helplang=en
set nospell
set spelllang=en_us
set fileformats=unix,dos,mac
set wildcharm=<C-Z>
set nobackup
set noswapfile
set undofile
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:‡
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•

set statusline=
set statusline+=%<%{toupper(mode())}
set statusline+=%4c
set statusline+=\ %{expand('%:p:h:t')}
set statusline+=/%t
set statusline+=%h%r
set statusline+=\ %#search#
set statusline+=%{&modified?'+++':''}
set statusline+=%*
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype:''}
