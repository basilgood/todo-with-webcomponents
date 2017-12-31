scriptencoding utf-8

function! s:load_editorconfig()
  if findfile('.editorconfig', '.;') != ''
    packadd editorconfig-vim
    EditorConfigReload
  endif
endfunction

autocmd BufEnter * call s:load_editorconfig()
let g:EditorConfig_core_mode = 'python_builtin'

