pkgs:
# vim: set syntax=vim:
''
  set encoding=utf-8
  scriptencoding utf-8

  set number
  set mouse=a
  set cursorline
  set lazyredraw
  set noswapfile
  set shortmess+=I
  set noshowmode
  set nowrap
  set splitbelow
  set splitright
  set switchbuf=useopen,usetab
  set completeopt+=menuone
  set completeopt+=noinsert
  set completeopt+=noselect
  set omnifunc=syntaxcomplete#Complete
  set completefunc=syntaxcomplete#Complete
  set complete=.,w,b,u,U,t,i,d,k
  set pumheight=10
  set gdefault
  set hlsearch|nohlsearch
  set nostartofline
  set sidescrolloff=5
  set sidescroll=1
  set expandtab
  set smarttab
  set softtabstop=2
  set tabstop=2
  set shiftwidth=2
  set shiftround
  set diffopt+=context:3,indent-heuristic,algorithm:patience
  set inccommand=nosplit
  set updatetime=500
  set list listchars=tab:▷\ ,space:·,extends:»,precedes:«,nbsp:⦸
  augroup list_trail
    autocmd InsertEnter * set listchars-=trail:␣
    autocmd InsertLeave * set listchars+=trail:␣
  augroup END

  let &g:statusline=""
  let &g:statusline.=' %{winnr("$")>1?winnr():""}'
  let &g:statusline.=' %{toupper(mode())}'
  let &g:statusline.=' ⦁ %{expand("%:f")}'
  let &g:statusline.=' %h%r'
  let &g:statusline.='%{exists("g:loaded_fugitive")?"⦁ ".fugitive#head(5):""} '
  let &g:statusline.=' %#incsearch#%{&mod?" ✚✚✚ ":""}'
  let &g:statusline.='%*'
  let &g:statusline.='%='
  let &g:statusline.='%{&filetype!=#""?&filetype:""} ⦁'
  let &g:statusline.='%12(%c:%l/%L%) '
  set laststatus=2
  set wildmode=longest:full,full

  if has('termguicolors')
    set termguicolors
  endif
''
