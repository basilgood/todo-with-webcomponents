scriptencoding utf-8

" deoplete
let g:deoplete#enable_at_startup = 1

" ale
let g:ale_set_signs = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_code_actions_enabled = 1
let g:ale_sign_info = '_i'
let g:ale_sign_error = '_e'
let g:ale_sign_warning = '_w'
let g:ale_set_balloons = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_echo_msg_format = '%linter%: %s %severity%'
let g:ale_linters = {
      \   'jsx': ['eslint'],
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint'],
      \}
let g:ale_fixers = {
      \   'javascript': ['prettier', 'eslint'],
      \   'html': ['prettier', 'eslint'],
      \   'yaml': ['prettier'],
      \   'nix': ['nixpkgs-fmt']
      \}

nnoremap [a :ALEPreviousWrap<CR>
nnoremap ]a :ALENextWrap<CR>

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
function! Innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> gq :bn<bar>bd#<cr>
  nmap <buffer> D .!rm -rf
endfunction
autocmd vimRc FileType netrw call Innetrw()

"""" neovim-fuzzy
nnoremap <C-p> :packadd vim-picker<cr>:PickerEdit<CR>
nnoremap <bs> :packadd vim-picker<cr>:PickerBuffer<CR>

"""" markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

"""" easy-align.
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
