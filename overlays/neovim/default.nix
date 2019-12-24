self: super:
with super;
let
  customPlugins = import ./plugins.nix { inherit self super; };
  allPlugins = vimPlugins // customPlugins;
  lsp = import ../lsp self super;

  loadPlugin = p: ''
    set rtp^=${p.rtp}
    set rtp+=${p.rtp}/after
  '';

  ftplugins = ''
    filetype off | syntax off
    ${super.lib.concatStrings (map loadPlugin ftPackages)}
    filetype indent plugin on | syntax on
  '';

  ftPackages = with super.vimPlugins; [
    vim-coffee-script
    vim-jinja
    vim-markdown
    vim-json
    vim-nix
    customPlugins.vim-js
    customPlugins.jsx
    customPlugins.yats
    customPlugins.twig
  ];

  init = builtins.readFile ./config/init.vim;
  plugins = builtins.readFile ./config/plugins.vim;
  options = builtins.readFile ./config/options.vim;
  mappings = builtins.readFile ./config/mappings.vim;
  commands = builtins.readFile ./config/commands.vim;
  autocmds = builtins.readFile ./config/autocmds.vim;

in
{

  neovim = neovim.override {
    withNodeJs = true;
    extraMakeWrapperArgs = "--prefix PATH : ${stdenv.lib.makeBinPath
      [
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
    }";

    configure = {
      packages.myVimPackage = with allPlugins; {

        start = ftPackages ++ [
          allfunc
          neomake
          repeat
          LanguageClient-neovim
          async.vim
        ];

        opt = [
          vim-picker
          deoplete-nvim
          ags
          surround
          tcomment_vim
          vim-html-template-literals
          vim-indent-object
          quickfix-reflector-vim
          vim-easy-align
          multiple-cursors
          vim-fugitive
          vim-gitgutter
          targets
          vim-mergetool
          conflict-marker
          auto-git-diff
          vim-dispatch
          vim-edgemotion
          vim-editorconfig
          cool
          retro
          candy
        ];
      };

      customRC = ''
        ${ftplugins}
        ${init}
        ${plugins}
        ${options}
        ${mappings}
        ${commands}
        ${autocmds}
      '';
    };
  };
}
