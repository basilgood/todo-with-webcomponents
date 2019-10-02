pkgs:
# vim: set syntax=vim:
''
  " autocmds
  augroup plugins
    autocmd BufReadPre * silent execute 'packadd' . ' vim-editorconfig'
    autocmd BufReadPost * silent execute 'packadd' . ' ale'
    autocmd BufWinEnter * silent execute 'packadd' . ' fzf-vim'
    autocmd VimEnter * silent execute 'packadd' . ' mergetool-vim'
    autocmd BufRead * silent execute 'packadd' . ' tcomment'
    autocmd BufRead * silent execute 'packadd' . ' vim-repeat'
    autocmd BufRead * silent execute 'packadd' . ' vim-surround'
    autocmd FileType qf silent execute 'packadd' . ' quickfix-vim'
  augroup END

  augroup set_filetype
    autocmd BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
    autocmd BufNewFile,BufRead *.vim setlocal filetype=vim
    autocmd BufNewFile,BufRead *.nix setlocal filetype=nix
    autocmd BufNewFile,BufRead *.html setlocal filetype=html
    autocmd BufNewFile,BufRead *.yamllint setlocal filetype=yaml
    autocmd BufNewFile,BufRead *.yml setlocal filetype=yaml
    autocmd BufRead,BufNewFile *.md,.markdown packadd vim-markdown
    autocmd BufReadPre,BufNewFile *.j2 packadd vim-jinja | setlocal filetype=jinja
    autocmd BufReadPre,BufNewFile *.twig packadd twig-vim | setlocal filetype=twig.html
    autocmd BufReadPre,BufNewFile *.coffee packadd vim-coffee-script | setlocal filetype=coffee
    autocmd BufReadPre,BufNewFile *.ts,*.tsx packadd yats-vim | packadd jsx-vim | setlocal filetype=typescript
    autocmd BufReadPre,BufNewFile *.js,*.jsx packadd vim-javascript-syntax | packadd jsx-vim | packadd vim-html-template-literals | set filetype=javascript
  augroup END

  augroup syntax_sync
    autocmd CursorHold * syntax sync minlines=300
  augroup END

  augroup remember_position
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
  augroup END

  augroup checktime_refresh
    autocmd FocusGained * if !bufexists("[Command Line]") | checktime | endif
  augroup END

  augroup diff_update
    autocmd InsertLeave * if &l:diff | diffupdate | endif
  augroup END

  function! s:large_file(name)
    let b:large_file = 1
    syntax clear
    set eventignore+=FileType
    let &backupskip .= ',' . a:name
    setlocal foldmethod=manual nofoldenable noswapfile noundofile norelativenumber
    augroup large_buffer
      autocmd BufWinEnter <buffer> call <sid>restore_eventignore()
    augroup END
  endf

  function! s:restore_eventignore()
    set eventignore-=FileType
    autocmd! large_buffer
    augroup! large_buffer
  endf

  augroup large_file
    autocmd BufReadPre *
          \ let s = getfsize(expand("<afile>")) |
          \ if s > g:LargeFile || s == -2 |
          \   call s:large_file(fnamemodify(expand("<afile>"), ":p")) |
          \ endif
  augroup END
''
