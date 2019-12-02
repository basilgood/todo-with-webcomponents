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
    filetype off | syn off
    ${super.lib.concatStrings (map loadPlugin startPackages)}
    filetype indent plugin on | syn on
  '';

  startPackages = with super.vimPlugins; [
    vim-javascript
    vim-coffee-script
    vim-jinja
    vim-markdown
    vim-json
    vim-nix
    customPlugins.yats
    customPlugins.twig
    customPlugins.jsx
    customPlugins.jsonc
  ];

  init = builtins.readFile ./config/init.vim;
  coc = builtins.readFile ./config/coc.vim;
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

        start = startPackages ++ [ allfunc neomake ];

        opt = [
          vinegar
          ags
          coc-nvim
          actionmenu
          surround
          repeat
          tcomment_vim
          vim-html-template-literals
          undotree
          vim-indent-object
          quickfix-reflector-vim
          vim-easy-align
          multiple-cursors
          auto-git-diff
          skim
          skim-vim
          vim-fugitive
          vim-dispatch
          targets
          wildfire
          conflicted
          vim-mergetool
          vcs-jump
          conflict-marker
          vim-edgemotion
          cool
          vim-editorconfig
          vim-parenmatch
          cmdline
          nordish
        ];
      };

      customRC = ''
        ${ftplugins}
        ${init}
        ${coc}
        ${plugins}
        ${options}
        ${mappings}
        ${commands}
        ${autocmds}
      '';
    };
  };
}
