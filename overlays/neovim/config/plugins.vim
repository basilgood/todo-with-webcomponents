scriptencoding utf-8

"""" neomake
let g:neomake_warning_sign = {
      \ 'text': '_w',
      \ }
let g:neomake_error_sign = {
      \ 'text': '_e',
      \ }
augroup my_neomake
  au!
  autocmd FileType nix call neomake#configure#automake_for_buffer('nw', 1000)
augroup END

"""" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

"""" lsp
if executable('typescript-language-server')
  augroup LspTS
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'ts',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
      \ 'whitelist': ['typescript', 'typescript.tsx']
      \ })
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'js',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
    autocmd FileType javascript setlocal omnifunc=lsp#complete
    autocmd FileType javascript.jsx setlocal omnifunc=lsp#complete
    autocmd FileType typescript setlocal omnifunc=lsp#complete
    autocmd FileType typescript.tsx setlocal omnifunc=lsp#complete
  augroup END
endif

if executable('vim-language-server')
  augroup LspVi
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'viml',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vim-language-server --stdio']},
          \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
          \ 'whitelist': ['vim']
          \ })
    autocmd FileType vim setlocal omnifunc=lsp#complete
  augroup END
endif

nnoremap [lsp] <Nop>
nmap <space>l [lsp]
vmap <space>l [lsp]
nnoremap [lsp]a :<C-u>LspCodeAction<CR>
nnoremap [lsp]D :<C-u>LspDeclaration<CR>
nnoremap [lsp]d :<C-u>LspDefinition<CR>
nnoremap [lsp]q :<C-u>LspDocumentDiagnostics<CR>
nnoremap [lsp]r :<C-u>LspRename<CR>
nnoremap [lsp]R :<C-u>LspReferences<CR>
nnoremap [lsp]p :<C-u>LspPreviousError<CR>
nnoremap [lsp]n :<C-u>LspNextError<CR>
nnoremap [lsp]f :<C-u>LspDocumentFormat<CR>
vnoremap [lsp]f :<C-u>LspDocumentRangeFormat<CR>
nnoremap [lsp]t :<C-u>LspTypeDefinition<CR>
nnoremap [lsp]s :<C-u>LspDocumentSymbol<CR>
nnoremap [lsp]S :<C-u>LspWorkspaceSymbol<CR>
nnoremap [lsp]? :<C-u>LspStatus<CR>

let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    LspHover
  endif
endfunction

"""" git, fugitive
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

"""" gitgutter
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)


"""" mergetool
let g:mergetool_layout = 'bmr'
nmap [git]m <plug>(MergetoolToggle)
nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'
if &diff == 1
  vmap <silent> <buffer> dg :diffget<CR>
  vmap <silent> <buffer> dp :diffput<CR>
  nmap <silent> <buffer> dg V:diffget<CR>
  nmap <silent> <buffer> dp V:diffput<CR>
endif

"""" surround.
let surround_indent=1
nmap S ysiw

"""" editorconfig.
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" netrw
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile             = 1
let g:netrw_sort_dotfiles_first = 1
let g:netrw_dirhistmax          = 0
let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_list_hide='^\./$,^\../$'
setlocal bufhidden=delete

nmap <silent> - :call functions#opendir()<CR>

"""" picker
nnoremap <C-p> :PickerEdit<CR>
nnoremap <C-t> :PickerEdit %:h<CR>
nnoremap <bs> :PickerBuffer<cr>

"""" ags
let g:ags_enable_async = 1
let g:ags_winplace = 'right'
nnoremap <Leader>a :Ags<Space>

"""" markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

"""" easy-align.
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"""" edgemotion
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

"""" cool
let g:CoolTotalMatches = 1
