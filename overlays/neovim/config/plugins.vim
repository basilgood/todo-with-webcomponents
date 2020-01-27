scriptencoding utf-8

" lsp
autocmd vimRc BufReadPost *
      \ execute 'packadd nvim-lsp'
lua << EOF
if not package.loaded.nvim_lsp then
  vim.cmd 'packadd nvim-lsp'
  vim._update_package_paths()
end
local nvim_lsp = require'nvim_lsp'

nvim_lsp.tsserver.setup {
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = { 'javascript', 'typescript' }
}

nvim_lsp.vimls.setup {
  cmd = {'vim-language-server', '--stdio'},
  filetypes = { 'vim' }
}
EOF

" deoplete
autocmd vimRc BufReadPost *
      \ execute 'packadd deoplete.nvim' |
      \ execute 'packadd deoplete-lsp'
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
autocmd vimRc BufReadPost *
      \ execute 'packadd ale'

"""" git, fugitive
autocmd vimRc BufReadPre *
      \ execute 'packadd vim-fugitive'
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-dispatch'
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
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '|'
let g:gitgutter_sign_modified           = '|'
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)


" git
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-mergetool'
autocmd vimRc BufReadPre *
      \ execute 'packadd conflict-marker.vim'
autocmd vimRc FileType gitrebase
      \ execute 'packadd auto-git-diff'
let g:mergetool_layout = 'bmr'
nmap [git]m <plug>(MergetoolToggle)

"""" surround.
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-surround'
let surround_indent=1
nmap S ysiw

" tcomment_vim
autocmd vimRc BufReadPost *
      \ execute 'packadd tcomment_vim'

" hlyank
autocmd vimRc BufReadPost *
      \ execute 'packadd hlyank.vim'

" targets
autocmd vimRc BufReadPost *
      \ execute 'packadd targets-vim'

" vim-async-grep
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-async-grep'

"""" editorconfig.
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-editorconfig'
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" netrw
autocmd vimRc BufEnter *
      \ execute 'packadd vim-vinegar'
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile             = 1
function! Innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> gq :bn<bar>bd#<cr>
  nmap <buffer> D .!rm -rf
endfunction
autocmd vimRc FileType netrw call Innetrw()

" leadef
let g:Lf_DefaultExternalTool = 'ag'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<bs>'
let g:Lf_WindowHeight = 0.25
let g:Lf_CursorBlink = 0
let g:Lf_CacheDirectory = '/tmp'
nnoremap <C-p> :packadd LeaderF<cr>:LeaderfFile<cr>
nnoremap <C-h> :packadd LeaderF<cr>:LeaderfFile %:h<cr>

"""" markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

"""" easy-align.
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ftplugins
autocmd vimRc BufReadPre *.nix
      \ execute 'packadd vim-nix'

let g:htl_all_templates = 1
let g:htl_css_templates = 1
autocmd vimRc BufReadPre *.js,*.jsx
      \ execute 'packadd vim-javascript' |
      \ execute 'packadd vim-html-template-literals'

autocmd vimRc BufReadPre *.pug
      \ execute 'packadd vim-pug' |
      \ execute 'packadd vim-pug-complete'

autocmd vimRc BufReadPre *.coffee
      \ execute 'packadd vim-coffee-script'

autocmd vimRc BufReadPre *.md
      \ execute 'packadd vim-markdown'

autocmd vimRc BufReadPre *.jinja
      \ execute 'packadd vim-jinja'

autocmd vimRc BufReadPre *.twig
      \ execute 'packadd vim-twig'

autocmd vimRc BufReadPre *.json
      \ execute 'packadd vim-fixjson'
