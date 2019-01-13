with import <nixpkgs> {};

vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    # custom vimrc
    customRC = ''
    scriptencoding utf-8

    set shell=/bin/sh

    augroup MyVimrc
    autocmd!
    augroup END
    command! -nargs=* AutoCmd autocmd MyVimrc <args>

    let g:loaded_vimballPlugin = 1
    let g:loaded_getscriptPlugin = 1
    let g:loaded_rrhelper = 1
    let g:did_install_default_menus = 1
    let g:sh_noisk = 1

    set number nowrap
    set noshowmatch matchtime=1 shortmess+=I
    set noruler rulerformat= laststatus=2 statusline=%f\ %=\ %m%r%y%w\ %3l/%L:%-2c
    set list listchars=tab:▷┅,trail:~,space:·,extends:»,precedes:«,nbsp:⦸ 
    set splitbelow splitright switchbuf=useopen,usetab 
    set scrolloff=5 sidescroll=1 sidescrolloff=5 nostartofline
    set nostartofline
    set smartindent autoindent shiftround shiftwidth=2 expandtab tabstop=2 smarttab softtabstop=2
    set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
    set backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
    set hidden autoread mouse=a modeline& modelines&
    set history=1000 viminfo='10,/100,:1000,<10,@10,s10,h
    set noswapfile nobackup
    set incsearch hlsearch|nohlsearch
    set complete=.,w,b,u,t,i,k omnifunc=syntaxcomplete#Complete
    set completeopt=menuone,preview,noinsert,noselect pumheight=10
    set wildmenu wildoptions= wildignorecase
    set updatetime=300 timeoutlen=1000 ttimeout ttimeoutlen=50 ttyfast lazyredraw

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

    nnoremap <Space>n :nohlsearch<CR>
    nnoremap j gj
    nnoremap k gk
    vnoremap > >gv
    vnoremap < <gv
    nnoremap <C-s> :update<CR>
    inoremap <C-s> <Esc>:update<CR>
    xnoremap <C-s> <C-C>:<C-u>update<CR>
    nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
    nnoremap <silent> <M--> :vertical resize +1<CR>
    nnoremap <silent> <M-=> :vertical resize -1<CR>
    vnoremap . :normal .<CR>
    nnoremap ,w :set wrap!<cr>
    nnoremap <Leader>w :%s/\s\+$//e<CR>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>
    inoremap <C-a> <Home>
    inoremap <C-e> <End>
    nnoremap <Space>s :%s//<left>
    vnoremap <Space>s :s//<left>
    nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>
    vnoremap <Leader>r :s/\<<C-r><C-w>\>/<C-r><C-w>
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    nnoremap <space><space> :tabnew %<CR>
    nnoremap <space>q :tabclose<CR>
    nnoremap <Space>w viw"+p
    nnoremap <Space>p :put+<CR>
    nnoremap <Space>P :put!+<CR>
    vnoremap <Space>y "+y
    vnoremap <Space>p "+p
    vnoremap <Space>P "+P
    nnoremap / /\v
    nnoremap ? ?\v
    nnoremap n nzzzv
    nnoremap N Nzzzv
    map [1;5A <C-Up>
    map [1;5B <C-Down>
    map [1;5C <C-Left>
    map [1;5D <C-Right>
    map [1;2A <S-Up>
    map [1;2B <S-Down>
    map [1;2C <S-Right>
    map [1;2D <S-Left>

    AutoCmd BufEnter * syntax sync minlines=500
    AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
    AutoCmd InsertLeave * silent! set nopaste
    AutoCmd BufLeave * if !&diff | let b:winview = winsaveview() | endif
    AutoCmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) |
      \ unlet! b:winview | endif

      '';
 };
}
