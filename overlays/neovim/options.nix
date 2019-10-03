pkgs:
# vim: set syntax=vim:
''
  set number
  set mouse=a
  set cursorline
  set lazyredraw
  set noswapfile
  set shortmess+=Icm
  set noshowmode
  set nowrap
  set splitbelow
  set splitright
  set switchbuf=useopen,usetab
  set signcolumn=yes
  set tabline=%!functions#tabline()
  set omnifunc=syntaxcomplete#Complete
  set completefunc=syntaxcomplete#Complete
  set completeopt+=menuone,noselect
  set completeopt-=preview
  set complete=.,w,b,u,U,t,i,d,k
  set pumheight=12
  set gdefault
  set hlsearch|nohlsearch
  set nostartofline
  set sidescrolloff=5
  set sidescroll=1
  set expandtab
  set softtabstop=2
  set tabstop=2
  set shiftwidth=2
  set shiftround
  set diffopt+=context:3,indent-heuristic,algorithm:patience
  set inccommand=nosplit
  set timeoutlen=1000 ttimeoutlen=0
  set updatetime=300
  set wildmode=longest:full,full
  set helplang=en
  set nospell
  set spelllang=en_us
  set fileformats=unix,dos,mac
  let vimDir = '$HOME/.cache'
  if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
  endif
  set list
  let &g:listchars = 'tab:▸ ,trail:•,extends:❯,precedes:❮,nbsp:⦸'
  augroup list_trail
    autocmd InsertEnter * set listchars-=trail:•
    autocmd InsertLeave * set listchars+=trail:•
  augroup END

  let &g:statusline=""
  let &g:statusline.=' %{winnr("$")>1?winnr():""}'
  let &g:statusline.=' %{toupper(mode())}'
  let &g:statusline.='  '
  let &g:statusline.='%{expand("%:s")}'
  let &g:statusline.='  '
  let &g:statusline.='%h%r'
  let &g:statusline.='%{exists("g:loaded_fugitive")?fugitive#head(5):""} '
  let &g:statusline.='%{exists("g:did_coc_loaded")?coc#status():""}'
  let &g:statusline.=' %#incsearch#%{&mod?" ✚✚✚ ":""}'
  let &g:statusline.='%*'
  let &g:statusline.='%='
  let &g:statusline.='%{&filetype!=#""?&filetype:""}'
  let &g:statusline.='  '
  let &g:statusline.='%12(%c:%l/%L%) '

  if has('termguicolors')
    set termguicolors
  endif
''
