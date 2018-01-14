scriptencoding utf-8

" nerdtree
command! File packadd nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMouseMode = 3
" let NERDTreegnore=['public']
nmap - :File<CR>:NERDTreeToggle<CR>
nmap <leader>- :NERDTreeFind<CR>

function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
