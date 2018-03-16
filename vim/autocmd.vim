AutoCmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
"AutoCmd BufWritePost,BufEnter * Neomake
AutoCmd FileType qf call AdjustWindowHeight(3, 10)
AutoCmd BufEnter * packadd vim-extended-ft
