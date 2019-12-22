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

"""" lsp
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0
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
nnoremap [lsp]h :<C-u>LspHover<CR>
nnoremap [lsp]s :<C-u>LspDocumentSymbol<CR>
nnoremap [lsp]S :<C-u>LspWorkspaceSymbol<CR>
nnoremap [lsp]? :<C-u>LspStatus<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

"""" git.
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

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

"""" skim(fzf)
let $SKIM_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
let $SKIM_DEFAULT_OPTS = '--bind ctrl-f:toggle'

nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Files %:h<CR>
nnoremap <silent> <leader>] :History:<cr>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

let g:buffer_action = {
      \ 'ctrl-x': 'sb',
      \ 'ctrl-v': 'vsp|b',
      \ 'ctrl-w': 'bdelete'
      \}

function! BufferSink(lines)
  if len(a:lines)<2
    return
  endif
  let key = remove(a:lines, 0)
  let Cmd = get(g:buffer_action, key,'buffer')
  for line in a:lines
    let bid = matchstr(line, '^[ 0-9]*')
    execute Cmd bid
  endfor
endfunction

noremap <silent> <Bs> :call skim#run(skim#wrap({
      \ 'source':  reverse(<sid>buflist()),
      \ 'sink*':  function('BufferSink'),
      \ 'options': '-m --expect='.join(keys(buffer_action), ',')
      \ }))<CR>


"""" ags
let g:ags_enable_async = 1
let g:ags_winplace = 'right'

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
