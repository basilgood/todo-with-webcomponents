self: super:
with super;
let
  customPlugins = import ./plugins.nix { inherit self super; };
  allPlugins = vimPlugins // customPlugins;
in
  {
    neovim = neovim.override {
      withNodeJs = true;

      configure = {
        customRC = builtins.readFile ./initvim;
        packages.myVimPackage = with allPlugins; {

          start = [
            allfunc
          ];

          opt = [
          vinegar
          coc-nvim
          surround
          repeat
          commentary
          vim-nix
          polyglot
          vim-html-template-literals
          jsonc
          undotree
          vim-indent-object
          quickfix-reflector-vim
          vim-easy-align
          auto-git-diff
          ferret
          fzfWrapper
          vim-startify
          vim-fugitive
          fzf-vim
          vim-dispatch
          targets
          wildfire
          gv
          conflict3
          vcs-jump
          vim-edgemotion
          vim-editorconfig
          vim-parenmatch
          vim-submode
          cmdline
          theonlyone
          ];
        };

      };
    };
  }
