self: super:
with super;
with stdenv.lib;
let
  plugins = callPackage ./plugins { };
  kakoune = kakoune-unwrapped.overrideAttrs (odl: rec {
    src = fetchFromGitHub {
      repo = "kakoune";
      owner = "mawww";
      rev = "ec31d839724cfd0f8431c04509f1f1d2b5fa1290";
      sha256 = "1nrsj74gfa0axaakvvfyhvcm7khi9fs2akfb4w5hng8azkgdr416";
    };
  });
  eslint-formatter-kakoune = fetchFromGitHub {
    owner = "Delapouite";
    repo = "eslint-formatter-kakoune";
    rev = "910ecf922d17a3f373e4f6cb441b4ec52c3ba035";
    sha256 = "02i67xcmw4z101r25sgwiyqjif25yd0i1bfmgz5vmd2vhfl4jdc3";
  };
in {
  kak = stdenv.mkDerivation {
    name = "kakoune-configured-${getVersion kakoune}";
    nativeBuildInputs = [ makeWrapper ];
    kakrc = writeText "kakrc" ''
      set-option global scrolloff            1,5
      set-option global tabstop              2
      set-option global indentwidth          2
      set-option global aligntab             false
      set-option global startup_info_version 20290108
      set-option global autoreload           yes
      set global ui_options ncurses_enable_mouse=true
      # grep
      set-option global grepcmd 'rg -L --column'
      # editorconfig
      hook global WinCreate ^[^*]+$ %{editorconfig-load}
      # highlighters
      hook global WinCreate .* %{
        addhl window/wrap wrap -marker '↪ '
        addhl window/number-lines number-lines -hlcursor
        addhl window/show-whitespaces show-whitespaces -tab '›' -tabpad ' ' -lf ' ' -spc ' ' -nbsp '⍽'
        addhl window/show-matching show-matching
        addhl window/regex regex \b(TODO|FIXME|XXX|NOTE|BUG|DEBUG|TBD|HACK)\b 0:default+rb
        addhl window/regex regex '[^\S\n]+$' 0:Error
      }
      # use spaces instead of tab as a indent
      hook global InsertChar \t %{
          exec -draft h@
      }
      hook global InsertDelete ' ' %{ try %{
          execute-keys -draft 'h<a-h><a-k>\A\h+\z<ret>i<space><esc><lt>'
      }}
      # highlight
      hook global WinCreate .* %{
        set-face global string green
        set-face global comment            rgb:818896
        set-face global selection rgb:373b41
        set-face global Search             black,rgb:373b41
        set-face global PrimarySelectionDefault black,rgb:373b41
        set-face global LineNumbers        rgb:434C5E
        set-face global LineNumberCursor   rgb:5E81AC
        set-face global LineNumbersWrapped rgb:5E81AC
        set-face global MenuForeground     rgb:D8DEE9
        set-face global MenuBackground     rgb:D8DEE9,rgb:3B4252
        set-face global MenuInfo           rgb:3B4252
        set-face global Information        rgb:D8DEE9
        set-face global StatusLine         white,black
        set-face global StatusLineMode     rgb:EBCB8B
        set-face global StatusLineInfo     rgb:88C0D0
        set-face global StatusLineValue    rgb:D08770
        set-face global StatusCursor       rgb:D8DEE9
        set-face global Whitespace black
      }

      # escape
      map global normal '<esc>' ' ;<esc>' \
          -docstring 'remove all selection except main, reduce selection to cursor, and stop highlighting search matches'

      # find
      map global user f :find<space><tab>
      # format
      map global user = :format<ret> -docstring 'format buffer'
      # System clipboard handling
      map global user p ': execute-keys "<lt>a-!>xsel --output --clipboard<lt>ret>"<ret>' \
          -docstring 'paste (after) from clipboard'
      map global user P ': execute-keys "!xsel --output --clipboard<lt>ret>"<ret>' \
          -docstring 'paste (before) from clipboard'
      map global user R ': execute-keys "|xsel --output --clipboard<lt>ret>"<ret>' \
          -docstring 'replace from clipboard'
      map global user y %{ : execute-keys '<lt>a-|>xsel --input --clipboard<lt>ret>y: echo -markup %{{Information}yanked selection to X11 clipboard and register '}<lt>ret>"<ret> } \
          -docstring 'yank to clipboard'
      map global user d ': execute-keys "<lt>a-|>xsel --input --clipboard<lt>ret>d"<ret>' \
          -docstring 'yank to clipboard and delete'
      map global user c ': execute-keys "<lt>a-|>xsel --input --clipboard<lt>ret>c"<ret>' \
          -docstring 'yank to clipboard and delete and enter insert mode'
      map global normal '#' ': comment-line<ret>'      -docstring 'toggle line comment'
      map global normal '<a-#>' ': comment-block<ret>' -docstring 'toggle block comment'
      # make x select lines downward and X select lines upward
      define-command -hidden -params 1 extend-line-down %{
          execute-keys "<a-:>%arg{1}X"
      }

      define-command -hidden -params 1 extend-line-up %{
          execute-keys "<a-:><a-;>%arg{1}K<a-;>"
          try %{
              execute-keys -draft ';<a-K>\n<ret>'
              execute-keys X
          }
          execute-keys '<a-;><a-X>'
      }

      map global normal x ': extend-line-down %val{count}<ret>'
      map global normal X ': extend-line-up %val{count}<ret>'
      # Enable <tab>/<s-tab> for insert completion selection
      hook global InsertCompletionShow .* %{
          map window insert <tab>   <c-n>
          map window insert <s-tab> <c-p>
      }
      hook global InsertCompletionHide .* %{
          unmap window insert <tab>   <c-n>
          unmap window insert <s-tab> <c-p>
      }
      def find -params 1 -shell-script-candidates %{ fd --type file --follow --hidden --exclude .git } %{ edit %arg{1} }

      # fzf
      map global normal <c-p> ': fzf-mode<ret>'
      hook global ModuleLoaded fzf %{
        set-option global fzf_implementation "sk"
        set-option global fzf_file_command "fd --type file --follow --hidden --exclude .git"
        set-option global fzf_highlight_command "bat --style=numbers --color=always {}"
        set-option global fzf_preview_tmux_height '20%'
        set-option global fzf_sk_grep_command "rg -L --no-heading"
      }
      map global normal <space> , -docstring 'leader'
      map global user b :fzf-buffer<ret> -docstring ':fzf-buffer'
      map global user c :cd<space> -docstring ':cd'
      map global user g :grep<space> -docstring ':grep'
      map global user G :git<space> -docstring ':git '
      map global user d :delete-buffer<ret> -docstring ':delete-buffer'
      map global user D :delete-buffer!<ret> -docstring ':delete-buffer!'
      map global user l :lint<ret> -docstring ':lint'
      map global user m :make<ret> -docstring ':make'
      map global user r :lf<ret> -docstring ':lf'
      map global user t :tag<space> -docstring ':tag'
      map global user w :write<ret> -docstring ':write'
      map global user q :write-quit<ret> -docstring ':write-quit'
      map global user Q :quit!<ret> -docstring ':quit!'
      # lsp
      eval %sh{${kak-lsp}/bin/kak-lsp --kakoune -s $kak_session --config ${
        writeText "kak-lsp.toml" ''
          [language.js]
          filetypes = ["javascript"]
          roots = ["package.json", "tsconfig.json"]
          command = "typescript-language-server"
          args = ["--stdio"]
          [language.tsx]
          filetypes = ["typescript"]
          roots = ["package.json", "tsconfig.json"]
          command = "typescript-language-server"
          args = ["--stdio"]
        ''
      }}
      hook global WinSetOption filetype=(javascript|typescript) %{
        lsp-enable-window
      }
      hook global BufSetOption filetype=(javascript|typescript) %{
        set-option buffer formatcmd "prettier --stdin-filepath='%val{buffile}'"
        set-option buffer lintcmd "eslint --fix -c .eslintrc* -f ${eslint-formatter-kakoune}/index.js --stdin-filename '%val{buffile}' --stdin <"
      }
      hook global BufSetOption filetype=nix %{
        set-option buffer formatcmd "nixfmt"
      }
      try %{ source .kakrc.local }
      try %{ source .kakrc.mine }
    '';
    buildCommand = ''
      mkdir -p $out/bin
      mkdir -p $out/share/kak/autoload/plugins
      # symlink core
      ln -sfv ${kakoune}/share/kak/autoload/ $out/share/kak/autoload/core
      # config
      ln -sfv $kakrc $out/share/kak/kakrc
      #plugins
      ln -sfv ${kakounePlugins.kak-fzf}/share/kak/autoload/plugins/fzf $out/share/kak/autoload/plugins/fzf
      ln -sfv ${plugins.typescript}/share/kak/autoload/plugins/typescript $out/share/kak/autoload/plugins/typescript
      ln -sfv ${plugins.filetree}/share/kak/autoload/filetree $out/share/kak/autoload/filetree
      makeWrapper ${kakoune}/bin/kak $out/bin/kak \
        --prefix PATH : ${
          makeBinPath [
            skim
            fd
            ripgrep
            bat
            editorconfig-core-c
            nixfmt
            universal-ctags
            nodePackages.typescript-language-server
          ]
        } \
        --set XDG_CONFIG_HOME $out/share/
    '';
  };
}
