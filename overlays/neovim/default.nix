self: super:
with super;
let
  customPlugins = import ./plugins.nix { inherit self super; };
  allPlugins = vimPlugins // customPlugins;

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

in {

  neovim = neovim.override {
    withNodeJs = true;

    configure = {
      packages.myVimPackage = with allPlugins; {

        start = ftPackages ++ [ allfunc neomake repeat vim-lsp async.vim ];

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
