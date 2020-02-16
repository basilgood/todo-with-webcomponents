# theme plumone

evaluate-commands %sh{
  plum0='rgb:1e222c'
  plum1='rgb:3B4252'
  plum2='rgb:434C5E'
  plum3='rgb:4C566A'
  plum4='rgb:ebdbb2'
  plum5='rgb:E5E9F0'
  plum6='rgb:ECEFF4'
  plum7='rgb:8FBCBB'
  plum8='rgb:88C0D0'
  plum9='rgb:ff7ab2'
  plum10='rgb:5E81AC'
  plum11='rgb:BF616A'
  plum12='rgb:D08770'
  plum13='rgb:EBCB8B'
  plum14='rgb:0f7575'
  plum15='rgb:B48EAD'

  echo "
    # code
    face global value              ${plum15}
    face global type               ${plum6}
    face global variable           ${plum6}
    face global module             ${plum6}
    face global function           ${plum9}
    face global string             ${plum14}
    face global keyword            ${plum9}+b
    face global operator           ${plum9}
    face global attribute          ${plum6}
    face global comment            ${plum3}+i
    face global meta               ${plum7}
    face global builtin            default+b

    # markup
    face global title              ${plum4}+b
    face global header             ${plum4}
    face global bold               ${plum4}+b
    face global italic             ${plum4}+i
    face global mono               ${plum4}
    face global block              ${plum4}
    face global link               ${plum10}
    face global bullet             ${plum15}
    face global list               ${plum4}

    # builtin
    face global Default            ${plum4},${plum0}
    face global PrimarySelection   ${plum8},${plum1}
    face global SecondarySelection ${plum8},${plum10}
    face global PrimaryCursor      ${plum1},${plum4}
    face global SecondaryCursor    ${plum10},${plum4}
    face global PrimaryCursorEol   ${plum7},${plum7}
    face global SecondaryCursorEol ${plum11},${plum7}
    face global LineNumbers        ${plum3},${plum0}
    face global LineNumberCursor   ${plum10},${plum1}
    face global LineNumbersWrapped ${plum10},${plum1}
    face global MenuForeground     ${plum5},${plum3}
    face global MenuBackground     ${plum4},${plum0}
    face global MenuInfo           ${plum1}
    face global Information        ${plum4},${plum0}
    face global Error              ${plum11},default+b
    face global StatusLine         ${plum4}
    face global StatusLineMode     ${plum13}
    face global StatusLineInfo     ${plum8}
    face global StatusLineValue    ${plum12}
    face global StatusCursor       ${plum2},${plum5}+B
    face global Prompt             ${plum4},${plum0}+b
    face global MatchingChar       ${plum4},${plum1}+b
    face global BufferPadding      ${plum11},${plum0}
    face global Whitespace         ${plum3}
  "
}
