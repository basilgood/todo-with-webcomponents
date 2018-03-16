scriptencoding utf-8

if has('termguicolors')
  set t_8b=[48;2;%lu;%lu;%lum
  set t_8f=[38;2;%lu;%lu;%lum
  set termguicolors
endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

colorscheme base16-onedark
