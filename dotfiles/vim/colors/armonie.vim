" 'armonie.vim' -- Vim color scheme.
" Author:       Romain Lafourcade (romainlafourcade@gmail.com)
" Description:  Essentially a streamlining and conversion to xterm colors of
"               'sorcerer' by Jeet Sukumaran (jeetsukumaran@gmailcom)
" Last Change:  2017 Oct 07

" MADE-UP NAME    HEX        RGB                   XTERM  ANSI
" ========================================================================
" almost black    #1c1c1c    rgb(28, 28, 28)       234    0
" 141413
" darker grey     #262626    rgb(38, 38, 38)       235    background color
" #1c1b1a
" dark grey       #303030    rgb(48, 48, 48)       236    8
" grey            #444444    rgb(68, 68, 68)       238    8
" #30343c 236
" medium grey     #585858    rgb(88, 88, 88)       240    8
" lighter grey    #bcbcbc    rgb(188, 188, 188)    250    foreground color
" ebdbb2
" white           #ffffff    rgb(255, 255, 255)    154    15
" aeee00
" purple          #5f5f87    rgb(95, 95, 135)      60     5
" light purple    #8787af    rgb(135, 135, 175)    141    13
" #a080ea
" green           #5f875f    rgb(95, 135, 95)      65     2
" light green     #87af87    rgb(135, 175, 135)    108    10
" #f4cf86', 222
" aqua            #5f8787    rgb(95, 135, 135)     66     6
" #a080ea
" light aqua      #5fafaf    rgb(95, 175, 175)     73     14
" blue            #ffa724    rgb(95, 135, 175)     214     4
" #ffa724 214
" light blue      #8fafd7    rgb(143, 175, 215)    110    12
" #ff2c4b', 196
" red             #af5f5f    rgb(175, 95, 95)      131    1
" orange          #b88853    rgb(255, 135, 0)      208    9
" #b88853 137
" ocre            #87875f    rgb(135, 135, 95)     101    3
" #304a68
" yellow          #ffffaf    rgb(255, 255, 175)    229    11

hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'armonie'

if ($TERM =~# '256' || &t_Co >= 256) || has('gui_running')
  hi Normal           ctermbg=235  ctermfg=250  guibg=#1c1b1a guifg=#f8f6f2 cterm=NONE           gui=NONE
  hi EndOfBuffer      ctermbg=235  ctermfg=250  guibg=#141413 guifg=NONE    cterm=NONE           gui=NONE
  hi Terminal         ctermbg=235  ctermfg=250  guibg=#1c1b1a guifg=#ebdbb2 cterm=NONE           gui=NONE
  hi LineNr           ctermbg=234  ctermfg=242  guibg=#141413 guifg=#585858 cterm=NONE           gui=NONE
  hi FoldColumn       ctermbg=234  ctermfg=242  guibg=#141413 guifg=#ebdbb2 cterm=NONE           gui=NONE
  hi Folded           ctermbg=234  ctermfg=242  guibg=#141413 guifg=#ebdbb2 cterm=NONE           gui=NONE
  hi MatchParen       ctermbg=234  ctermfg=229  guibg=#141413 guifg=#ffffaf cterm=NONE           gui=NONE
  hi signColumn       ctermbg=234  ctermfg=242  guibg=#141413 guifg=#ebdbb2 cterm=NONE           gui=NONE

  set background=dark

  hi Comment          ctermbg=NONE ctermfg=240  guibg=NONE    guifg=#585858 cterm=italic         gui=italic
  hi Conceal          ctermbg=NONE ctermfg=250  guibg=NONE    guifg=#ebdbb2 cterm=NONE           gui=NONE
  hi Constant         ctermbg=NONE ctermfg=208  guibg=NONE    guifg=#b88853 cterm=NONE           gui=NONE
  hi Error            ctermbg=NONE ctermfg=131  guibg=NONE    guifg=#af5f5f cterm=reverse        gui=reverse
  hi Identifier       ctermbg=NONE ctermfg=214  guibg=NONE    guifg=#ffa724 cterm=NONE           gui=NONE
  hi Ignore           ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE           gui=NONE
  hi PreProc          ctermbg=NONE ctermfg=66   guibg=NONE    guifg=#a080ea cterm=NONE           gui=NONE
  hi Special          ctermbg=NONE ctermfg=65   guibg=NONE    guifg=#5f875f cterm=NONE           gui=NONE
  hi Statement        ctermbg=NONE ctermfg=110  guibg=NONE    guifg=#ff2c4b cterm=NONE           gui=NONE
  hi String           ctermbg=NONE ctermfg=108  guibg=NONE    guifg=#f4cf86 cterm=NONE           gui=NONE
  hi Todo             ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=reverse        gui=reverse
  hi Type             ctermbg=NONE ctermfg=141  guibg=NONE    guifg=#a080ea cterm=NONE           gui=NONE
  hi Underlined       ctermbg=NONE ctermfg=66   guibg=NONE    guifg=#a080ea cterm=underline      gui=underline

  hi NonText          ctermbg=NONE ctermfg=240  guibg=NONE    guifg=#585858 cterm=NONE           gui=NONE

  hi Pmenu            ctermbg=238  ctermfg=250  guibg=#30343c guifg=#ebdbb2 cterm=NONE           gui=NONE
  hi PmenuSbar        ctermbg=240  ctermfg=NONE guibg=#585858 guifg=NONE    cterm=NONE           gui=NONE
  hi PmenuSel         ctermbg=66   ctermfg=235  guibg=#a080ea guifg=#1c1b1a cterm=NONE           gui=NONE
  hi PmenuThumb       ctermbg=66   ctermfg=66   guibg=#a080ea guifg=#5f8787 cterm=NONE           gui=NONE

  hi ErrorMsg         ctermbg=131  ctermfg=235  guibg=#af5f5f guifg=#1c1b1a cterm=NONE           gui=NONE
  hi ModeMsg          ctermbg=108  ctermfg=235  guibg=#f4cf86 guifg=#1c1b1a cterm=NONE           gui=NONE
  hi MoreMsg          ctermbg=NONE ctermfg=66   guibg=NONE    guifg=#a080ea cterm=NONE           gui=NONE
  hi Question         ctermbg=NONE ctermfg=108  guibg=NONE    guifg=#f4cf86 cterm=NONE           gui=NONE
  hi WarningMsg       ctermbg=NONE ctermfg=131  guibg=NONE    guifg=#af5f5f cterm=NONE           gui=NONE

  hi TabLine          ctermbg=238  ctermfg=101  guibg=#30343c guifg=#304a68 cterm=NONE           gui=NONE
  hi TabLineFill      ctermbg=238  ctermfg=238  guibg=#30343c guifg=#444444 cterm=NONE           gui=NONE
  hi TabLineSel       ctermbg=101  ctermfg=235  guibg=#304a68 guifg=#1c1b1a cterm=NONE           gui=NONE

  hi Cursor           ctermbg=242  ctermfg=NONE guibg=#ebdbb2 guifg=NONE    cterm=NONE           gui=NONE
  hi CursorColumn     ctermbg=236  ctermfg=NONE guibg=#303030 guifg=NONE    cterm=NONE           gui=NONE
  hi CursorLineNr     ctermbg=236  ctermfg=73   guibg=#303030 guifg=#5fafaf cterm=NONE           gui=NONE
  hi CursorLine       ctermbg=236  ctermfg=NONE guibg=#303030 guifg=NONE    cterm=NONE           gui=NONE

  hi helpLeadBlank    ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE           gui=NONE
  hi helpNormal       ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=NONE           gui=NONE

  hi StatusLine       ctermbg=101  ctermfg=235  guibg=#304a68 guifg=#1c1b1a cterm=NONE           gui=NONE
  hi StatusLineNC     ctermbg=238  ctermfg=101  guibg=#30343c guifg=#304a68 cterm=NONE           gui=NONE

  hi StatusLineTerm   ctermbg=101  ctermfg=235  guibg=#304a68 guifg=#1c1b1a cterm=NONE           gui=NONE
  hi StatusLineTermNC ctermbg=238  ctermfg=101  guibg=#30343c guifg=#304a68 cterm=NONE           gui=NONE

  hi Visual           ctermbg=235  ctermfg=110  guibg=#1c1b1a guifg=#8fafd7 cterm=reverse        gui=reverse
  hi VisualNOS        ctermbg=NONE ctermfg=NONE guibg=NONE    guifg=NONE    cterm=underline      gui=underline

  hi VertSplit        ctermbg=238  ctermfg=238  guibg=#30343c guifg=#444444 cterm=NONE           gui=NONE
  hi WildMenu         ctermbg=110  ctermfg=235  guibg=#8fafd7 guifg=#1c1b1a cterm=NONE           gui=NONE

  hi Function         ctermbg=NONE ctermfg=229  guibg=NONE    guifg=#ffffaf cterm=NONE           gui=NONE
  hi SpecialKey       ctermbg=NONE ctermfg=240  guibg=NONE    guifg=#585858 cterm=NONE           gui=NONE
  hi Title            ctermbg=NONE ctermfg=154  guibg=NONE    guifg=#aeee00 cterm=NONE           gui=NONE

  hi DiffAdd          ctermbg=235  ctermfg=108  guibg=#1c1b1a guifg=#f4cf86 cterm=reverse        gui=reverse
  hi DiffChange       ctermbg=235  ctermfg=141  guibg=#1c1b1a guifg=#a080ea cterm=reverse        gui=reverse
  hi DiffDelete       ctermbg=235  ctermfg=131  guibg=#1c1b1a guifg=#af5f5f cterm=reverse        gui=reverse
  hi DiffText         ctermbg=235  ctermfg=208  guibg=#1c1b1a guifg=#b88853 cterm=reverse        gui=reverse

  hi IncSearch        ctermbg=131  ctermfg=235  guibg=#af5f5f guifg=#1c1b1a cterm=NONE           gui=NONE
  hi Search           ctermbg=229  ctermfg=235  guibg=#ffffaf guifg=#1c1b1a cterm=NONE           gui=NONE

  hi Directory        ctermbg=NONE ctermfg=73   guibg=NONE    guifg=#5fafaf cterm=NONE           gui=NONE

  hi debugPC          ctermbg=214                guibg=#ffa724
  hi debugBreakpoint  ctermbg=131               guibg=#af5f5f

  if has('gui_running')
    hi SpellBad       ctermbg=NONE ctermfg=131  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#af5f5f
    hi SpellCap       ctermbg=NONE ctermfg=73   guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#5fafaf
    hi SpellLocal     ctermbg=NONE ctermfg=65   guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#5f875f
    hi SpellRare      ctermbg=NONE ctermfg=208  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#b88853
  else
    hi SpellBad       ctermbg=NONE ctermfg=131  guibg=NONE    guifg=#af5f5f cterm=undercurl      gui=undercurl guisp=NONE
    hi SpellCap       ctermbg=NONE ctermfg=73   guibg=NONE    guifg=#5fafaf cterm=undercurl      gui=undercurl guisp=NONE
    hi SpellLocal     ctermbg=NONE ctermfg=65   guibg=NONE    guifg=#5f875f cterm=undercurl      gui=undercurl guisp=NONE
    hi SpellRare      ctermbg=NONE ctermfg=208  guibg=NONE    guifg=#b88853 cterm=undercurl      gui=undercurl guisp=NONE
  endif

  hi ColorColumn      ctermbg=234  ctermfg=NONE guibg=#141413 guifg=NONE    cterm=NONE           gui=NONE
elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
  set t_Co=16

  hi Normal           ctermbg=NONE        ctermfg=white          cterm=NONE
  hi Terminal         ctermbg=NONE        ctermfg=white          cterm=NONE

  set background=dark

  hi Comment          ctermbg=NONE        ctermfg=gray        cterm=NONE
  hi Conceal          ctermbg=NONE        ctermfg=white       cterm=NONE
  hi Constant         ctermbg=NONE        ctermfg=red         cterm=NONE
  hi Function         ctermbg=NONE        ctermfg=yellow      cterm=NONE
  hi Identifier       ctermbg=NONE        ctermfg=darkblue    cterm=NONE
  hi PreProc          ctermbg=NONE        ctermfg=darkcyan    cterm=NONE
  hi Special          ctermbg=NONE        ctermfg=darkgreen   cterm=NONE
  hi Statement        ctermbg=NONE        ctermfg=blue        cterm=NONE
  hi String           ctermbg=NONE        ctermfg=green       cterm=NONE
  hi Todo             ctermbg=NONE        ctermfg=NONE        cterm=reverse
  hi Type             ctermbg=NONE        ctermfg=magenta     cterm=NONE

  hi Error            ctermbg=NONE        ctermfg=darkred     cterm=reverse
  hi Ignore           ctermbg=NONE        ctermfg=NONE        cterm=NONE
  hi Underlined       ctermbg=NONE        ctermfg=NONE        cterm=reverse

  hi LineNr           ctermbg=black       ctermfg=gray        cterm=NONE
  hi NonText          ctermbg=NONE        ctermfg=darkgray    cterm=NONE

  hi Pmenu            ctermbg=darkgray    ctermfg=white       cterm=NONE
  hi PmenuSbar        ctermbg=gray        ctermfg=NONE        cterm=NONE
  hi PmenuSel         ctermbg=darkcyan    ctermfg=black       cterm=NONE
  hi PmenuThumb       ctermbg=darkcyan    ctermfg=NONE        cterm=NONE

  hi ErrorMsg         ctermbg=darkred     ctermfg=black       cterm=NONE
  hi ModeMsg          ctermbg=darkgreen   ctermfg=black       cterm=NONE
  hi MoreMsg          ctermbg=NONE        ctermfg=darkcyan    cterm=NONE
  hi Question         ctermbg=NONE        ctermfg=green       cterm=NONE
  hi WarningMsg       ctermbg=NONE        ctermfg=darkred     cterm=NONE

  hi TabLine          ctermbg=darkgray    ctermfg=darkyellow  cterm=NONE
  hi TabLineFill      ctermbg=darkgray    ctermfg=black       cterm=NONE
  hi TabLineSel       ctermbg=darkyellow  ctermfg=black       cterm=NONE

  hi Cursor           ctermbg=NONE        ctermfg=NONE        cterm=NONE
  hi CursorColumn     ctermbg=darkgray    ctermfg=NONE        cterm=NONE
  hi CursorLineNr     ctermbg=black       ctermfg=cyan        cterm=NONE
  hi CursorLine       ctermbg=darkgray    ctermfg=NONE        cterm=NONE

  hi helpLeadBlank    ctermbg=NONE        ctermfg=NONE        cterm=NONE
  hi helpNormal       ctermbg=NONE        ctermfg=NONE        cterm=NONE

  hi StatusLine       ctermbg=darkyellow  ctermfg=black       cterm=NONE
  hi StatusLineNC     ctermbg=darkgray    ctermfg=darkyellow  cterm=NONE

  hi StatusLineterm   ctermbg=darkyellow  ctermfg=black       cterm=NONE
  hi StatusLinetermNC ctermbg=darkgray    ctermfg=darkyellow  cterm=NONE

  hi Visual           ctermbg=black       ctermfg=blue        cterm=reverse
  hi VisualNOS        ctermbg=black       ctermfg=white       cterm=reverse

  hi FoldColumn       ctermbg=black       ctermfg=darkgray    cterm=NONE
  hi Folded           ctermbg=black       ctermfg=darkgray    cterm=NONE

  hi VertSplit        ctermbg=darkgray    ctermfg=darkgray    cterm=NONE
  hi WildMenu         ctermbg=blue        ctermfg=black       cterm=NONE

  hi SpecialKey       ctermbg=NONE        ctermfg=darkgray    cterm=NONE
  hi Title            ctermbg=NONE        ctermfg=white       cterm=NONE

  hi DiffAdd          ctermbg=black       ctermfg=green       cterm=reverse
  hi DiffChange       ctermbg=black       ctermfg=magenta     cterm=reverse
  hi DiffDelete       ctermbg=black       ctermfg=darkred     cterm=reverse
  hi DiffText         ctermbg=black       ctermfg=red         cterm=reverse

  hi IncSearch        ctermbg=darkred     ctermfg=black       cterm=NONE
  hi Search           ctermbg=yellow      ctermfg=black       cterm=NONE

  hi Directory        ctermbg=NONE        ctermfg=cyan        cterm=NONE
  hi MatchParen       ctermbg=black       ctermfg=yellow      cterm=NONE

  hi SpellBad         ctermbg=NONE        ctermfg=darkred     cterm=undercurl
  hi SpellCap         ctermbg=NONE        ctermfg=darkyellow  cterm=undercurl
  hi SpellLocal       ctermbg=NONE        ctermfg=darkgreen   cterm=undercurl
  hi SpellRare        ctermbg=NONE        ctermfg=darkmagenta cterm=undercurl

  hi ColorColumn      ctermbg=black       ctermfg=NONE        cterm=NONE
  hi SignColumn       ctermbg=black       ctermfg=darkgray    cterm=NONE

  hi debugPC          ctermbg=blue
  hi debugBreakpoint  ctermbg=red
endif

let g:terminal_ansi_colors = [
            \ '#141413',
            \ '#af5f5f',
            \ '#5f875f',
            \ '#304a68',
            \ '#ffa724',
            \ '#5f5f87',
            \ '#a080ea',
            \ '#ebdbb2',
            \ '#30343c',
            \ '#b88853',
            \ '#f4cf86',
            \ '#ffffaf',
            \ '#8fafd7',
            \ '#a080ea',
            \ '#5fafaf',
            \ '#aeee00'
            \ ]

let links = [
            \ ['Boolean', 'Constant'],
            \ ['Character', 'Constant'],
            \ ['Conditional', 'Statement'],
            \ ['Debug', 'Special'],
            \ ['Define', 'PreProc'],
            \ ['Delimiter', 'Special'],
            \ ['Exception', 'Statement'],
            \ ['Float', 'Number'],
            \ ['HelpCommand', 'Statement'],
            \ ['HelpExample', 'Statement'],
            \ ['Include', 'PreProc'],
            \ ['Keyword', 'Statement'],
            \ ['Label', 'Statement'],
            \ ['Macro', 'PreProc'],
            \ ['Number', 'Constant'],
            \ ['Operator', 'Statement'],
            \ ['PreCondit', 'PreProc'],
            \ ['Repeat', 'Statement'],
            \ ['SpecialChar', 'Special'],
            \ ['SpecialComment', 'Special'],
            \ ['StorageClass', 'Type'],
            \ ['Structure', 'Type'],
            \ ['Tag', 'Special'],
            \ ['Terminal', 'Normal'],
            \ ['Typedef', 'Type'],
            \ ['htmlEndTag', 'htmlTagName'],
            \ ['htmlLink', 'Function'],
            \ ['htmlSpecialTagName', 'htmlTagName'],
            \ ['htmlTag', 'htmlTagName'],
            \ ['htmlBold', 'Normal'],
            \ ['htmlItalic', 'Normal'],
            \ ['xmlTag', 'Statement'],
            \ ['xmlTagName', 'Statement'],
            \ ['xmlEndTag', 'Statement'],
            \ ['markdownItalic', 'Preproc'],
            \ ['asciidocQuotedEmphasized', 'Preproc'],
            \ ['diffBDiffer', 'WarningMsg'],
            \ ['diffCommon', 'WarningMsg'],
            \ ['diffDiffer', 'WarningMsg'],
            \ ['diffIdentical', 'WarningMsg'],
            \ ['diffIsA', 'WarningMsg'],
            \ ['diffNoEOL', 'WarningMsg'],
            \ ['diffOnly', 'WarningMsg'],
            \ ['diffRemoved', 'WarningMsg'],
            \ ['diffAdded', 'String'],
            \ ]
augroup Armonie
    autocmd!
    autocmd ColorScheme * if expand("<amatch>") == "armonie" | for link in links | execute 'hi link' link[0] link[1] | endfor | else | for link in links | execute 'hi link' link[0] 'NONE' | endfor | endif
augroup END
