AutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | silent! checktime | endif
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
