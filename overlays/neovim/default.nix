self: super:
with super;
with lib;
let lsp = import ../lsp self super;
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
          fzf
          git
          lsp.js.vim-language-server
          lsp.js.import-js
          lsp.js.diagnostic-languageserver
          lsp.js.fixjson
          lsp.js.coc-git
          lsp.js.coc-eslint
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

  neovim = neovim.override {
    withNodeJs = true;
    # configure = {
    #   customRC = ''
    #     # here your custom configuration goes!
    #   '';
    # };
  };
}
