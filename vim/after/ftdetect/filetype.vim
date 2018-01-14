scriptencoding utf-8

autocmd BufReadPre,BufRead *.yml packadd iro.vim
let g:iro#enabled_filetypes = {
      \ 'yaml': 1,
      \ 'ruby': 1,
      \}

" autocmd BufReadPre,BufRead *.yml packadd vim-yaml
autocmd BufReadPre,BufRead *.html.twig,*.twig packadd vim-twig
autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
autocmd BufReadPre,BufRead *.md packadd vim-markdown
autocmd BufReadPre,BufRead *.nginx packadd nginx.vim
autocmd BufReadPre,BufRead *.fish packadd vim-fish
autocmd BufReadPre,BufRead *.coffee packadd vim-coffee-script
autocmd BufReadPre,BufRead *.json set conceallevel=0
autocmd BufReadPre,BufRead *.yamllint set filetype=yaml
