self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
in
{
  neovim-unwrapped = (neovim-unwrapped).overrideAttrs (
    old: rec {
      name = "neovim-unwrapped-${version}";
      version = "nightly";
      src = fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "5355cee77d7b3b62917036281406726832b6d7dc";
        sha256 = "0qk8r84v6aa6f0maqd02c2xzcb6bj9ahx0mwf72qvc7gwc64843r";
      };
      NIX_CFLAGS_COMPILE = "-O3 -march=native";
      buildInputs = old.buildInputs ++ [ utf8proc ];
      nativeBuildInputs = old.nativeBuildInputs ++ [ makeWrapper ];
      postInstall = old.postInstall + ''
        wrapProgram $out/bin/nvim --prefix PATH : ${ makeBinPath
        [
          ag
          lsp.js.vim-language-server
          lsp.js.import-js
          lsp.js.diagnostic-languageserver
          nodePackages.typescript
          nodePackages.eslint
          nodePackages.eslint_d
          nodePackages.prettier
          nodePackages.typescript-language-server
          nodePackages.vscode-html-languageserver-bin
          nodePackages.vscode-css-languageserver-bin
          nixpkgs-fmt
        ]
      }
      '';
    }
  );

  neovim = neovim.override {
    withNodeJs = true;
    configure = {};
  };
}
