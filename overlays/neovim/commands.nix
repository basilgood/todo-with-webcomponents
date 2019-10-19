pkgs:
# vim: set syntax=vim:
''
scriptencoding utf-8

command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! Bd setlocal bufhidden=delete | bnext
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 HL call functions#hl()
command! -nargs=* -complete=file Grp call functions#grep('grep<bang>',<q-args>)
command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
command! CmdHist call fzf#vim#command_history({'right': '40'})
command! OpenChangedFiles :call functions#changedfiles()
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
''
