scriptencoding utf-8

" autocmd BufReadPre,BufRead *.yml packadd iro.vim
" let g:iro#enabled_filetypes = {
"       \ 'yaml': 1,
"       \ 'ruby': 1,
"       \}

autocmd BufReadPre,BufRead *.yml packadd vim-yaml
autocmd BufReadPre,BufRead *.html.twig,*.twig packadd vim-twig
autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
autocmd BufReadPre,BufRead *.md packadd vim-markdown
autocmd BufReadPre,BufRead *.nginx packadd nginx.vim
autocmd BufReadPre,BufRead *.fish packadd vim-fish
autocmd BufReadPre,BufRead *.coffee packadd vim-coffee-script
autocmd BufReadPre,BufRead *.json set conceallevel=0

function! Sql()
  if has('gui_running')
    set guioptions=Mc
  endif

  set nowrap
  syntax off
  NeoCompleteDisable
  let g:loaded_2html_plugin      = 1
  let g:loaded_logiPat           = 1
  let g:loaded_getscriptPlugin   = 1
  let g:loaded_gzip              = 1
  let g:loaded_man               = 1
  let g:loaded_matchit           = 1
  let g:loaded_matchparen        = 1
  let g:loaded_netrwFileHandlers = 1
  let g:loaded_netrwPlugin       = 1
  let g:loaded_netrwSettings     = 1
  let g:loaded_rrhelper          = 1
  let g:loaded_shada_plugin      = 1
  let g:loaded_spellfile_plugin  = 1
  let g:loaded_tarPlugin         = 1
  let g:loaded_tutor_mode_plugin = 1
  let g:loaded_vimballPlugin     = 1
  let g:loaded_zipPlugin         = 1
endfunction
autocmd BufEnter,BufReadPre,BufRead *.sql call Sql()
