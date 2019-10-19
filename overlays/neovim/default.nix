self: super:
with super;

let plugins = callPackage ./plugins/default.nix { };
in {
  neovim = neovim.override {
    withNodeJs = true;
    configure = {
      customRC = ''
        set encoding=utf-8
        scriptencoding utf-8

        augroup vimRc
          autocmd!
        augroup END

        if has('vim_starting')
          let g:startuptime = reltime()
          autocmd vimRc VimEnter * let g:startuptime = reltime(g:startuptime) | redraw
            \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
        endif

        let g:loaded_matchparen         = 1
        let g:loaded_rrhelper           = 1
        let g:did_install_default_menus = 1
        let g:is_bash                   = 1
        let g:sh_noisk                  = 1
        let g:loaded_vimball            = 1
        let g:loaded_vimballPlugin      = 1
        let g:loaded_getscript          = 1
        let g:loaded_getscriptPlugin    = 1
        let g:loaded_logipat            = 1
        let g:loaded_man                = 1

        let s:mkdir = function('mkdir')
        let $CACHE      = expand('$HOME/.cache/')
        let $CACHE_NVIM = expand('$CACHE/nvim')

        """" lazy load plugins
        if has('vim_starting') && has('timers')
          autocmd vimRc VimEnter * call timer_start(1, 'functions#packaddhandler', {'repeat': 0})
        endif

        ${callPackage ./configs.nix { }}
        ${callPackage ./options.nix { }}
        ${callPackage ./mappings.nix { }}
        ${callPackage ./autocmds.nix { }}
        ${callPackage ./hlsearch.nix { }}
        ${callPackage ./commands.nix { }}

        colorscheme apprentice
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ ] ++ (with plugins; [ vim-startify all-func]);
        opt = [
          fugitive
          vinegar
          coc-nvim
          surround
          repeat
          vim-nix
          vim-coffee-script
          vim-jinja
          vim-markdown
          vim-json
          vim-go
          undotree
          vim-indent-object
          quickfix-reflector-vim
          vim-easy-align
        ] ++ (with plugins; [
          fzf-vim
          vim-dispatch
          tcomment
          vim-auto-cursorline
          targets
          wildfire
          gv
          vim-edgemotion
          vim-editorconfig
          cmdline
          vim-javascript
          vim-jsx-pretty
          jsonc
          yats
          twig
          apprentice
        ]);
      };
    };
  };
}
