self: super:
with super;

let plugins = callPackage ./plugins/default.nix { };
in {

  neovim = neovim.override {
    withNodeJs = true;
    configure = {
      customRC = ''
        if !v:vim_did_enter && has('reltime')
          let g:startuptime = reltime()
          augroup vimrc-startuptime
            autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
              \ | redraw
              \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
          augroup END
        endif
        augroup vimrc
          autocmd!
        augroup END
        """" large file
        let g:LargeFile = 20*1024*1024 " 20MB
        ${callPackage ./options.vim.nix { }}
        ${callPackage ./mappings.vim.nix { }}
        ${callPackage ./autocmds.vim.nix { }}
        ${callPackage ./configs.vim.nix { }}
        ${callPackage ./hlsearch.nix { }}

        syntax enable
        colorscheme simple
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ fugitive vinegar vim-nix rust-vim ]
          ++ (with plugins; [ vim-startify easy-align ]);
        opt = [
          surround
          repeat
          vim-coffee-script
          vim-jinja
          vim-markdown
          undotree
          vim-indent-object
          quickfix-reflector-vim
        ] ++ (with plugins; [
          ale
          fzf-vim
          agit
          tcomment
          vim-auto-cursorline
          targets
          wildfire
          ags
          vim-edgemotion
          vim-editorconfig
          cmdline
          mergetool
          simple
          javascript_syntax
          vim-javascript
          jsx
          html_template
          yats
          twig
          autoload
        ]);
      };
    };
  };
}
