pkgs:
# vim: set syntax=vim:
''
  " autocmds
  augroup plugins
    autocmd BufReadPre * silent execute 'packadd' . ' vim-editorconfig'
    " autocmd BufReadPost * silent execute 'packadd' . ' ale'
    autocmd BufWinEnter * silent execute 'packadd' . ' fzf-vim'
    autocmd BufWinEnter * silent execute 'packadd' . ' vim-auto-cursorline'
    autocmd VimEnter * silent execute 'packadd' . ' mergetool-vim'
    autocmd VimEnter * silent execute 'packadd' . ' autoload'
    autocmd BufRead * silent execute 'packadd' . ' tcomment'
    autocmd BufRead * silent execute 'packadd' . ' vim-repeat'
    autocmd BufRead * silent execute 'packadd' . ' vim-surround'
    autocmd BufRead * silent execute 'packadd' . ' targets.vim'
    autocmd BufRead * silent execute 'packadd' . ' wildfire.vim'
    autocmd BufRead * silent execute 'packadd' . ' vim-ags'
    autocmd BufRead * silent execute 'packadd' . ' vim-edgemotion'
    autocmd BufRead * silent execute 'packadd' . ' vim-indent-object'
    autocmd BufRead * silent execute 'packadd' . ' undotree'
    autocmd BufRead * silent execute 'packadd' . ' agit.vim'
    autocmd BufRead * silent execute 'packadd' . ' coc-nvim' | autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd CmdlineEnter * packadd cmdline-completion
    autocmd FileType qf silent execute 'packadd' . ' quickfix-vim'
    autocmd FileType javascript silent execute 'packadd' . ' vim-javascript'
    autocmd FileType javascript silent execute 'packadd' . ' vim-javascript-syntax'
    autocmd FileType javascript silent execute 'packadd' . ' jsx-vim'
    autocmd FileType typescript silent execute 'packadd' . ' yats-vim'
    autocmd FileType typescript silent execute 'packadd' . ' jsx-vim'
    autocmd FileType coffee silent execute 'packadd' . ' vim-coffee-script'
    autocmd FileType twig silent execute 'packadd' . ' twig-vim'
    autocmd FileType jinja silent execute 'packadd' . ' vim-jinja'
    autocmd FileType markdown silent execute 'packadd' . ' vim-markdown'
    autocmd FileType json silent execute 'packadd' . ' vim-json'
    autocmd FileType jsonc silent execute 'packadd' . ' jsonc.vim'
    autocmd FileType go silent execute 'packadd' . ' vim-go'
  augroup END

  augroup set_filetype
    autocmd BufRead,BufNewFile *.gitignore  setlocal filetype=gitignore
    autocmd BufNewFile,BufRead *.vim setlocal filetype=vim
    autocmd BufNewFile,BufRead *.nix setlocal filetype=nix
    autocmd BufNewFile,BufRead *.html setlocal filetype=html
    autocmd BufNewFile,BufRead *.yamllint setlocal filetype=yaml
    autocmd BufNewFile,BufRead *.yml setlocal filetype=yaml
    autocmd BufRead,BufNewFile *.md,.markdown setlocal filetype=markdown
    autocmd BufReadPre,BufNewFile *.j2 setlocal filetype=jinja
    autocmd BufReadPre,BufNewFile *.twig setlocal filetype=twig.html
    autocmd BufReadPre,BufNewFile *.coffee setlocal filetype=coffee
    autocmd BufReadPre,BufNewFile *.ts,*.tsx setlocal filetype=typescript
    autocmd BufWinEnter *.json setlocal conceallevel=0 concealcursor=
    autocmd BufReadPre *.json setlocal conceallevel=0 concealcursor=
    autocmd BufReadPre *.json setlocal formatoptions=a2tq
    autocmd FileType json syntax match Comment +\/\/.\+$+
    autocmd FileType jsonc setlocal commentstring=//\ %s
  augroup END

  augroup syntax_sync
    autocmd CursorHold * syntax sync minlines=300
  augroup END

  augroup remember_position
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
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

  augroup help_qf
    autocmd FileType qf wincmd J
    autocmd BufWinEnter * if &ft == 'help' | wincmd J | end
    autocmd BufReadPost quickfix setlocal nobuflisted
    autocmd BufReadPost quickfix nnoremap <buffer> gq :bd<CR>
    autocmd FileType help nnoremap <buffer> gq :bd<CR>
    autocmd CmdwinEnter * nnoremap <silent><buffer> gq :<C-u>quit<CR>
  augroup END

  augroup mkdir
    autocmd BufWritePre * call functions#mkdirifnotexist()
  augroup END
''
