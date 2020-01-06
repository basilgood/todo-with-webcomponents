scriptencoding utf-8

" netrw.
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile             = 1

" neomake.
let g:neomake_highlight_columns = 0
autocmd vimRc FileType * call neomake#configure#automake_for_buffer('nw', 1000)

" lsc.
let g:lsc_server_commands = {
      \  'javascript': {
      \    'command': 'typescript-language-server --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'typescript': {
      \    'command': 'typescript-language-server --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'vim': {
      \    'command': 'vim-language-server --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'html': {
      \    'command': 'html-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'css': {
      \    'command': 'css-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  }
      \}
let g:lsc_auto_map = {
      \  'GoToDefinition': 'gd',
      \  'FindReferences': 'gr',
      \  'Rename': 'gR',
      \  'ShowHover': 'K',
      \  'Completion': 'omnifunc',
      \}
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

" git, fugitive.
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

" gitgutter.
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '|'
let g:gitgutter_sign_modified           = '|'

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" mergetool.
let g:mergetool_layout = 'bmr'
nmap [git]m <plug>(MergetoolToggle)
nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'

" surround.
let surround_indent=1
nmap S ysiw

" editorconfig.
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" markdown.
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

" easy-align.
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" fzy.
function! s:fuzzyfind(dir) abort
    let items = printf('fd --type f --hidden --follow --exclude .git --color=never "" %s', a:dir)
    return fzy#start(items, {i -> execute('edit ' . fnameescape(i))}, {
            \ 'statusline': printf(':edit {fname} [directory: %s]', a:dir)
            \ })
endfunction

command! -bar -nargs=? -complete=dir Find
        \ call s:fuzzyfind(empty(<q-args>) ? getcwd() : <q-args>)
nnoremap <silent> <c-p> :Find .<cr>

function! s:open_file_cb(vim_cmd, choice) abort
  let fname = fnameescape(a:choice)
  call histadd('cmd', a:vim_cmd . ' ' . fname)
  execute a:vim_cmd fname
endfunction

function! s:buffers(edit_cmd, bang, ...) abort
  let cmd = a:0
        \ ? empty(a:1) ? a:edit_cmd : (a:1 . ' ' . a:edit_cmd)
        \ : a:edit_cmd
  let items = map(
        \ filter(range(1, bufnr('$')),
        \   {_,val -> a:bang ? bufexists(val) : buflisted(val)}),
        \ {_,val -> empty(bufname(val)) ? val : bufname(val)}
        \ )
  let stl = printf(':%s [%s buffers (%d)]', cmd, a:bang ? 'all' : 'listed', len(items))
  return fzy#start(items, function('s:open_file_cb', [cmd]), {'statusline': stl})
endfunction
command! -bar -bang Buffer  call s:buffers('buffer', <bang>0)
nnoremap <silent> <bs> :Buffer<cr>
