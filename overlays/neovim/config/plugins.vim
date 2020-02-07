scriptencoding utf-8

" deoplete
autocmd vimRc BufReadPost *
      \ execute 'packadd deoplete.nvim' |
      \ execute 'packadd deoplete-lsp'
let g:deoplete#enable_at_startup = 1

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

" fzf
autocmd vimRc BufReadPost *
      \ execute 'packadd fzfWrapper'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
let g:fzf_layout = { 'down': '~25%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-w': 'bdelete'}
nnoremap <c-p> :Files<cr>
nnoremap <c-h> :Files %:h<cr>
nnoremap <bs> :Buffers<cr>

" super ruler(cohama)
function! SuperRuler(count)
  let cnt = (a:count == 0) ? '' : a:count
  redir => ruler_out
    silent execute 'silent normal! ' . cnt . "\<C-g>"
  redir END
  let super_ruler = ruler_out[2:] . ' | ' . &fileformat . ' | ' . &fileencoding . ' | ' . &filetype . ' | ' . VCSRepoInfo()
  echo super_ruler
endfunction

function! VCSRepoInfo() abort
  packadd vim-fugitive
  return fugitive#statusline()[1:]
endfunction
nnoremap <C-G> :<C-u>call SuperRuler(v:count)<CR>

" markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

" easy-align.
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" vim-smoothie
autocmd vimRc BufReadPost *
      \ execute 'packadd vim-smoothie'

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
