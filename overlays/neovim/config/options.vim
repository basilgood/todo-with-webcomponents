scriptencoding utf-8

" better defaults
set path& | let &path .= '**'
set gdefault
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set nobackup
set undofile
set inccommand=nosplit
set number
set mouse=a
set shortmess+=aoOtTIc
set sidescrolloff=10
set sidescroll=1
set switchbuf+=useopen,usetab
set splitbelow
set splitright
set nowrap
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience,iwhite
set timeoutlen=3000
set updatetime=50
set wildmode=longest:full,full
set wildignore=
      \*.png,
      \*.jpg,
      \*.gif,
      \*.gem,
      \*.swp,
      \*.zip,
      \*.gz,
      \*/.DS_Store/*,
      \*/tmp/*,
      \*/node_modules/*,
      \*/bower_components/*,
      \*/vendor/*,
      \*/pack/*,
      \*/.gem/*,
      \*/.git/*,
      \*/.hg/*,
      \*/.svn/*
set wildcharm=<C-Z>
set noshowmode
set tabline=%!functions#tabline()
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:‡
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•

" grep
if executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" statusline
set statusline=
set statusline+=%<%{toupper(mode())}
set statusline+=%4c
set statusline+=\ %{expand('%:p:h:t')}
set statusline+=/%t
set statusline+=%h%r
set statusline+=\ %#error#
set statusline+=%{&modified?'+++++':''}
set statusline+=%*
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype:''}
