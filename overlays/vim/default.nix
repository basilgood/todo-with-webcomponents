self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
in {
  vim_one = ((vim_configurable.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.2.0114";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "043sa5mqwnjy0mq6ldir067xk4dpv98xhkv4v0xyqi0sxigbcpla";
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
  })).override {
    python = python3;
    ftNixSupport = false;
  });
}
