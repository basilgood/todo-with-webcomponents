scriptencoding utf-8

" netrw
function! functions#innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> gq :bn<bar>bd#<cr>
  nmap <buffer> D .!rm -rf
endfunction

" fzy.
function! functions#fzy(choice_command, vim_command)
  try
    let output = system(a:choice_command . ' | fzy ')
  catch /Vim:Interrupt/
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

" highlight
function! functions#hl() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

" tabline
function! functions#tabline() abort
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, '&mod')
    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#StatusLine#' : '%#StatusLineNC#')
    let s .= ' ' . tab .':'
    let s .= (bufname !=# '' ? fnamemodify(bufname, ':t') . ' ' : 'No Name ')
    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists('g:tablineclosebutton'))
    let s .= '%=%999XX'
  endif
  return s
endfunction

" fix insert leave
function! functions#insertleave()
  let cursorPos = col('.')
  let maxColumn = col('$')
  if cursorPos < maxColumn && cursorPos != 1
    return "\<Esc>l"
  else
    return "\<Esc>"
  endif
endfunction

" lazy load plugins
function! functions#packhandler(timer)
  execute 'packadd vim-fzy'
  execute 'packadd vim-vinegar'
  execute 'packadd vim-fugitive'
  execute 'packadd vim-gitgutter'
  execute 'packadd vim-dispatch'
  execute 'packadd asyncdo.vim'
  execute 'packadd vim-editorconfig'
  execute 'packadd vim-surround'
  execute 'packadd vim-repeat'
  execute 'packadd tcomment_vim'
  execute 'packadd vim-easy-align'
  execute 'packadd vim-multiple-cursors'
  execute 'packadd vim-mergetool'
  execute 'packadd conflict-marker.vim'
  execute 'packadd auto-git-diff'
  execute 'packadd targets.vim'
  execute 'packadd vim-altscreen'
  execute 'packadd vim-indent-object'
  execute 'packadd vim-js'
  doautocmd fugitive BufReadPost
  doautocmd plugin-editorconfig BufReadPost
  doautocmd myNoAltScreen VimEnter
endfunction
