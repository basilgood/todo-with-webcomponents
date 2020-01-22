self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
  extraPlugins = callPackage ./plugins.nix { };
in {
  neovim-unwrapped = (neovim-unwrapped).overrideAttrs (old: rec {
    name = "neovim-unwrapped-${version}";
    version = "nightly";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "5355cee77d7b3b62917036281406726832b6d7dc";
      sha256 = "0qk8r84v6aa6f0maqd02c2xzcb6bj9ahx0mwf72qvc7gwc64843r";
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
        ]
      }
    '';
  });

  neovim = neovim.override {
    withNodeJs = true;
    configure = {
      packages.myVimPackage = with vimPlugins // extraPlugins; {
        start = [
          # nvim-lsp
          ale
          deoplete
          deoplete-lsp
          vim-nix
          vimfugitive
          dispatch
          vinegar
          gitgutter
          easy-align
          surround
          repeat
          sgureditorconfig
          tcomment_vim
          targets-vim
          hlyank
          quickfix-reflector-vim
          vim-async-grep
          vim-mergetool
          conflict-marker
          auto-git-diff
          vimjavascript
          vim-pug
          vim-pug-complete
          vim-coffee-script
          vim-markdown
          vim-jinja
          vim-twig
          vim-fixjson
        ];
        opt = [ vim-picker ];
      };
      customRC = ''
        ${builtins.readFile ./config/init.vim};
        ${builtins.readFile ./config/options.vim};
        ${builtins.readFile ./config/mappings.vim};
        ${builtins.readFile ./config/commands.vim};
        ${builtins.readFile ./config/autocmds.vim};
        ${builtins.readFile ./config/plugins.vim};
        ${builtins.readFile ./config/colorscheme.vim};
      '';
    };
  };
}
