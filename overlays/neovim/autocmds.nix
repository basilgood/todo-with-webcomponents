pkgs:
# vim: set syntax=vim:
''
  scriptencoding utf-8

  """" If a file is large, disable syntax highlighting, filetype etc
  let g:LargeFile = 20*1024*1024 " 20MB
  autocmd vimRc BufReadPre *
        \ let s = getfsize(expand("<afile>")) |
        \ if s > g:LargeFile || s == -2 |
        \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
        \ endif

  """" don't list location-list / quickfix windows
  autocmd vimRc BufReadPost quickfix setlocal nobuflisted
  autocmd vimRc BufReadPost quickfix nnoremap <buffer> gq :bd<CR>
  autocmd vimRc FileType help nnoremap <buffer> gq :bd<CR>
  autocmd vimRc CmdwinEnter * nnoremap <silent><buffer> gq :<C-u>quit<CR>

  """" qf and help keep widow full width
  autocmd vimRc FileType qf wincmd J
  autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

  """" update diff
  autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

  """" external changes
  autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

  """" mkdir
  autocmd vimRc BufWritePre * call functions#mkdirifnotexist()

  """" remember_position
  autocmd vimRc BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  """" filetype
  autocmd vimRc BufNewFile,BufRead *.nix setlocal filetype=nix
  autocmd vimRc BufNewFile,BufRead *.js,.jsx packadd setlocal filetype=javascript
  autocmd vimRc BufNewFile,BufRead *.twig setlocal filetype=html.twig
  autocmd vimRc BufNewFile,BufRead *.svelte setlocal filetype=svelte
  autocmd vimRc BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
  autocmd vimRc BufNewFile,BufRead *.vim setlocal filetype=vim
  autocmd vimRc BufNewFile,BufRead *.html setlocal filetype=html
  autocmd vimRc BufNewFile,BufRead *.yamllint setlocal filetype=yaml
  autocmd vimRc BufNewFile,BufRead *.yml setlocal filetype=yaml
  autocmd vimRc BufRead,BufNewFile *.md,.markdown setlocal filetype=markdown
  autocmd vimRc BufReadPre,BufNewFile *.j2 setlocal filetype=jinja
  autocmd vimRc BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
  autocmd vimRc BufReadPre,BufNewFile *.coffee setlocal filetype=coffee
  autocmd vimRc BufReadPre,BufNewFile *.ts,*.tsx setlocal filetype=typescript
  autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
  autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
  autocmd vimRc BufReadPre *.json setlocal formatoptions=a2tq
  autocmd vimRc FileType json syntax match Comment +\/\/.\+$+
  autocmd vimRc FileType jsonc setlocal commentstring=//\ %s
  autocmd vimRc BufReadPre    * doautocmd FileType
''