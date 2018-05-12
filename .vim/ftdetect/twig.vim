if !exists('g:vim_twig_filetype_detected') && has('autocmd')
  autocmd BufNewFile,BufRead *.twig set filetype=html.twig
  autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
  autocmd BufNewFile,BufRead *.xml.twig set filetype=xml.twig
endif
