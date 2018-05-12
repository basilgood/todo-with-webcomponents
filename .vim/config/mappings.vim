nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
nnoremap H ^
nnoremap L $
vnoremap L g_
nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <S-Tab> :wincmd W<CR>
nnoremap <silent> <C-Up> :resize -1<CR>
nnoremap <silent> <C-Down> :resize +1<CR>
nnoremap <silent> <C-Left> :vertical resize +1<CR>
nnoremap <silent> <C-Right> :vertical resize -1<CR>
vnoremap . :normal .<CR>
nnoremap ,w :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Space><Space> :tabnew %<CR>
nnoremap <Space>q :tabclose<CR>
vnoremap <Space>y "+y
nnoremap <Space>p "+p
vnoremap <Space>p "+p
nnoremap <Space>P "+P
vnoremap <Space>P "+P
inoremap <C-v> <ESC>"+gPa
nnoremap <Space>s :OverCommandLine<CR>%s/
nnoremap <Space>S :OverCommandLine<CR>s/
vnoremap <Space>s :OverCommandLine<CR>s/
map <Leader><Leader> :set cursorline!<CR>
nnoremap <silent> n nzz:call blink#Match()<CR>
nnoremap <silent> N Nzz:call blink#Match()<CR>
cnoremap <silent> <expr> <enter> center#Search()
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;5C <C-Left>
map [1;5D <C-Right>
map [1;2A <S-Up>
map [1;2B <S-Down>
map [1;2C <S-Right>
map [1;2D <S-Left>
