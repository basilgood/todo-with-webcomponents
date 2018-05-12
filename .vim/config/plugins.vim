scriptencoding utf-8
" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" leaderf
let g:Lf_ShortcutF = '<C-P>'
" let g:Lf_ShortcutB = '<Bs>'
let g:Lf_WindowHeight = 0.20
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_FollowLinks = 'yes'
nnoremap <Leader>m :LeaderfMru<CR>
nnoremap <Leader>n :LeaderfMruCwd<CR>
nnoremap <Leader>k :LeaderfHistoryCmd<CR>
nnoremap <Leader>p :LeaderfFilePattern<Space>

" nerdtree
nnoremap - :packadd nerdtree<CR>:NERDTreeToggle<CR>
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1
let g:NERDTreeHijackNetrw = 0

" asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

" ale lint
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
" let g:ale_sign_error = '→'
let g:ale_sign_error = 'e'
" let g:ale_sign_warning = '→'
let g:ale_sign_warning = 'w'
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint']
      \}
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint'],
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript',
      \}

" bufstop
nnoremap <Bs> :Bufstop<CR>

" ags
let g:ags_agexe = 'ag'
let g:ags_agmaxcount = 2000
let g:ags_agcontext = 1
let g:ags_enable_async = 1
let g:ags_winheight = ''
nnoremap ,f :Ags<CR>
nnoremap ,g :Ags<Space>

" prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#use_tabs = 'true'
