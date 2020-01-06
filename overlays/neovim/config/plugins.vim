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
  autocmd FileType * call neomake#configure#automake_for_buffer('nw', 1000)
augroup END

"""" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

"""" lsp
" let g:lsp_diagnostics_enabled = 1
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}
let g:lsp_virtual_text_prefix = ' ‣ '

let g:lsp_highlight_references_enabled = 0

let g:lsp_preview_float = 1

if executable('typescript-language-server')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio',]},
        \ 'whitelist': ['javascript', 'typescript', 'typescriptreact'],
        \ })
endif

if executable('vim-language-server')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vim-language-server --stdio',]},
        \ 'whitelist': ['vim'],
        \ })
endif

if executable('html-languageserver')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'html-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
        \ 'whitelist': ['html', 'html.twig', 'jinja.html'],
        \ })
endif

if executable('css-languageserver')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio',]},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  nnoremap [a :<C-u>LspCodeAction<CR>
  nnoremap [D :<C-u>LspDeclaration<CR>
  nnoremap [d :<C-u>LspDefinition<CR>
  nnoremap [q :<C-u>LspDocumentDiagnostics<CR>
  nnoremap [r :<C-u>LspRename<CR>
  nnoremap [R :<C-u>LspReferences<CR>
  nnoremap [p :<C-u>LspPreviousError<CR>
  nnoremap [n :<C-u>LspNextError<CR>
  nnoremap [f :<C-u>LspDocumentFormat<CR>
  vnoremap [f :<C-u>LspDocumentRangeFormat<CR>
  nnoremap [t :<C-u>LspTypeDefinition<CR>
  nnoremap [s :<C-u>LspDocumentSymbol<CR>
  nnoremap [S :<C-u>LspWorkspaceSymbol<CR>
  nnoremap [? :<C-u>LspStatus<CR>
  nnoremap K :<c-u>LspHover<cr>
endfunction

autocmd vimRc User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

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
