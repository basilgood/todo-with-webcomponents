scriptencoding utf-8

"""" netrw
function! functions#opendir() abort
  if expand('%') =~# '^$\|^term:[\/][\/]'
    Explore
  else
    edit %:h
  endif
endfunction

function! functions#innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> gq :bn<bar>bd#<cr>
  nmap <buffer> D .!rm -rf
  nnoremap <buffer> . :<c-u> <c-r>=fnamemodify(bufname('%'),':p').getline('.')<cr><home>
  nmap <buffer> ! .!
endfunction

"""" highlight
function! functions#hl() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

"""" tabline
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

" ruler
function! functions#superruler(count)
  let cnt = (a:count == 0) ? '' : a:count
  redir => ruler_out
    silent execute 'silent normal! ' . cnt . "\<C-g>"
  redir END
  let super_ruler = ruler_out[2:] . '    | ' . &fileformat . ' | ' . &fileencoding . ' | ' . &filetype . ' | ' . VCSRepoInfo()
  echo super_ruler
endfunction

function! VCSRepoInfo() abort
  packadd vim-fugitive
  doautocmd fugitive BufReadPost
  return fugitive#head()
endfunction

" lazy load plugins
function! functions#packaddhandler(timer)
  execute 'packadd vim-lsp'
  execute 'packadd deoplete-nvim'
  execute 'packadd vim-fugitive'
  execute 'packadd vim-gitgutter'
  execute 'packadd vim-ags'
  execute 'packadd vim-dispatch'
  execute 'packadd vim-picker'
  execute 'packadd vim-editorconfig'
  execute 'packadd vim-surround'
  execute 'packadd vim-repeat'
  execute 'packadd tcomment_vim'
  execute 'packadd vim-easy-align'
  execute 'packadd vim-multiple-cursors'
  execute 'packadd vim-mergetool'
  execute 'packadd conflict-marker.vim'
  execute 'packadd auto-git-diff'
  execute 'packadd vim-html-template-literals'
  execute 'packadd vim-indent-object'
  execute 'packadd targets.vim'
  execute 'packadd vim-edgemotion'
  execute 'packadd vim-cool'
  doautocmd fugitive BufReadPost
  doautocmd plugin-editorconfig BufReadPost
  doautocmd lsp_auto_enable VimEnter
endfunction
