unlet! g:skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim
set nocompatible
augroup MyVimrc
  autocmd!
augroup END

command! -nargs=* AutoCmd autocmd MyVimrc <args>

if has('vim_starting')
  let g:startuptime = reltime()
  AutoCmd VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
  \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

if has('vim_starting') && &encoding !=# 'utf-8'
  set encoding=utf-8
endif

set shell=sh

runtime! plugins.vim
runtime! theme.vim
runtime! options.vim
runtime! mappings.vim
