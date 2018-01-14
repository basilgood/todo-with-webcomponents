scriptencoding utf-8

" Clear hlsearch and set nopaste
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" reload vim and file
nmap <leader><leader> :source $MYVIMRC<cr>
nmap ,, :e<CR>

" physical moving
noremap j gj
noremap k gk

" indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" quick save, quit and undo
nnoremap <silent> <C-s> :<C-u>update<CR>
nnoremap <silent> <C-q> :<C-u>bw<CR>
inoremap <silent> <C-s> <Esc>:<C-u>update<CR>
xnoremap <silent> <C-s> <C-C>:<C-u>update<CR>
imap <silent> <C-z> <C-o>u

" Easier to type
noremap H ^
noremap L $
vnoremap L g_

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd
command! Q q
command! Qa qa

" widows
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent> <S-Tab>      :wincmd W<CR>
nnoremap <silent><expr> ,q winnr('$') != 1 ? ':<C-u>close<CR>' : ""

" visual select
nmap vv viw
vmap <Space> <esc>

" repeat last command for each line of a visual selection
vnoremap . :normal .<CR>

" numbers
noremap ,n :set invnumber<CR>

" substitute
nnoremap <F6> :<C-u>%s/<C-r>//
vnoremap <F6> :s/<C-r><C-w>/
nnoremap <F5> :<C-u>%s/<C-r><C-w>/

" Substitute
nnoremap ,s :%s/
vnoremap ,s :s/

" snippets
let g:minisnip_trigger = '<C-Space>'
