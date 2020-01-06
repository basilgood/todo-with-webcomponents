self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
in {
  vim_one = ((vim_configurable.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.2.0090";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1pq9i01kzvqzyw39qgakr7348n4c9ckjamlhjf3ls6sxg7fxpdcs";
    };
    nativeBuildInputs = [ makeWrapper ];
    postInstall = ''
      wrapProgram $out/bin/vim --prefix PATH : ${
        makeBinPath [
          ag
          fd
          fzy
          lsp.js.vim-language-server
          lsp.js.import-js
          lsp.js.stylelint
          nodePackages.typescript
          nodePackages.eslint
          nodePackages.typescript-language-server
          nodePackages.vscode-html-languageserver-bin
          nodePackages.vscode-css-languageserver-bin
          nixpkgs-fmt
        ]
      }
    '';
  })).override {
    python = python3;
    ftNixSupport = false;
  });
}
