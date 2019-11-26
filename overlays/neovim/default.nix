self: super:
with super;
let
  customPlugins = import ./plugins.nix { inherit self super; };
  allPlugins = vimPlugins // customPlugins;
in {
  neovim = neovim.override {
    withNodeJs = true;

    configure = {
      customRC = callPackage ./initvim.nix { };
      packages.myVimPackage = with allPlugins; {

        start = [ allfunc ];

        opt = [
          vinegar
          renamer
          coc-nvim
          neomake
          actionmenu
          surround
          repeat
          commentary
          vim-nix
          vim-javascript
          vim-html-template-literals
          vim-coffee-script
          vim-jinja
          vim-markdown
          vim-json
          vim-go
          yats
          twig
          jsx
          jsonc
          undotree
          vim-indent-object
          quickfix-reflector-vim
          vim-easy-align
          auto-git-diff
          ferret
          skim
          skim-vim
          vim-startify
          vim-fugitive
          vim-dispatch
          targets
          wildfire
          gv
          conflicted
          vim-mergetool
          vcs-jump
          conflict-marker
          vim-edgemotion
          cool
          vim-editorconfig
          vim-parenmatch
          vim-submode
          cmdline
          theonlyone
          nordish
        ];
      };

    };
  };
}
