scriptencoding utf-8

AutoCmd InsertEnter * packadd neocomplete.vim | NeoCompleteEnable
AutoCmd InsertEnter * packadd neco-syntax

let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#max_list = 20
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#enable_auto_close_preview = 0

let g:neocomplete#max_keyword_width = 10000

let g:neocomplete#sources#tags#cache_limit_size = 10000000

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
