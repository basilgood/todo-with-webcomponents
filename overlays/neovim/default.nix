self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
  extraPlugins = callPackage ./plugins.nix { };
  loadPlugin = plugin: ''
    set rtp^=${plugin.rtp}
    set rtp+=${plugin.rtp}/after
  '';
in {
  neovim-unwrapped = (neovim-unwrapped).overrideAttrs (old: rec {
    name = "neovim-unwrapped-${version}";
    version = "nightly";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "97dcc48c998ccecaa37a3cbea568d85c2f1407f9";
      sha256 = "1cnqmgfa33k6x0rbx5dhdqn1819rsggrwr0l4xwia8awbiwq93ym";
    };
    nativeBuildInputs = old.nativeBuildInputs ++ [ utf8proc makeWrapper ];
    postInstall = old.postInstall + ''
      wrapProgram $out/bin/nvim --prefix PATH : ${
        makeBinPath [
          ag
          fzy
          git
          lsp.js.vim-language-server
          lsp.js.import-js
          lsp.js.diagnostic-languageserver
          lsp.js.fixjson
          nodePackages.typescript
          nodePackages.eslint
          nodePackages.eslint_d
          nodePackages.prettier
          nodePackages.typescript-language-server
          nodePackages.vscode-html-languageserver-bin
          nodePackages.vscode-css-languageserver-bin
          nixpkgs-fmt
          nixfmt
          editorconfig-core-c
        ]
      }
    '';
  });

  neovim = (neovim.override {
    withNodeJs = true;
    configure = {
      packages.myVimPackage = with vimPlugins // extraPlugins; {
        start = [
          deoplete-lsp
          vim-nix
          vinegar
          gitgutter
          repeat
          quickfix-reflector-vim
          vimjavascript
          vim-pug
          vim-pug-complete
          vim-coffee-script
          vim-markdown
          vim-jinja
          vim-twig
          vim-fixjson
          lithtml
        ];
        opt = [
          nvim-lsp
          ale
          deoplete
          neovimfuzzy
          vimfugitive
          dispatch
          easy-align
          vim-surround
          sgureditorconfig
          tcomment_vim
          hlyank
          targets-vim
          vim-async-grep
          vim-mergetool
          conflict-marker
          auto-git-diff
        ];
      };
      customRC = ''
        filetype plugin indent on
        syntax enable
        ${builtins.readFile ./config/init.vim};
        ${builtins.readFile ./config/options.vim};
        ${builtins.readFile ./config/mappings.vim};
        ${builtins.readFile ./config/commands.vim};
        ${builtins.readFile ./config/autocmds.vim};
        ${builtins.readFile ./config/plugins.vim};
        ${builtins.readFile ./config/colorscheme.vim};
      '';
    };
  }).overrideAttrs (old: rec {
    buildCommand = ''
      export HOME=$TMPDIR
    '' + old.buildCommand;
  });
}
