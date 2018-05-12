scriptencoding utf-8
set incsearch
set hlsearch|nohlsearch
set nowrap
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set autoindent smartindent
set backspace=indent,eol,start
set matchpairs+=<:>
set hidden
set timeout timeoutlen=3000 ttimeoutlen=100
set updatetime=1000
set noswapfile
set virtualedit=block
set mouse=a
set number
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:»,precedes:«,nbsp:⦸
set laststatus=2
set noshowmatch
let &g:statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
      \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
      \ . "%{(&previewwindow?'[preview] ':'').expand('%:f')}"
      \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
      \ '['.(&filetype!=''?&filetype.',':'')"
      \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
      \ . "%m%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"
set linebreak
set showbreak=\
set breakat=\ \	;:,!?
set breakindent
set shortmess=atI
set nowritebackup
set nobackup
set noswapfile
set wildmenu
set wildmode=longest,full
set history=1000
set viminfo=!,'300,<50,s10,h
let g:did_install_default_menus = 1
set completeopt=menuone,preview,noinsert,noselect
set complete=.,w,b,u,t,i,k
set omnifunc=syntaxcomplete#Complete
set pumheight=10
set nostartofline
set scrolloff=5
set sidescroll=1
set sidescrolloff=5
set splitbelow
set splitright
set switchbuf=useopen,usetab
set ttyfast
set display=lastline
if exists('$TMUX')
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
  let &t_SI .= "\<Esc>[6 q"
  let &t_SR .= "\<Esc>[4 q"
  let &t_EI .= "\<Esc>[2 q"
endif
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
