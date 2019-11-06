self: super:
with super;

let plugins = callPackage ./plugins.nix { };

in {
  neovim = neovim.override {
    withNodeJs = true;
    configure = {
      customRC = ''
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

        ${callPackage ./options.nix { }}
        ${callPackage ./mappings.nix { }}
        ${callPackage ./autocmds.nix { }}
        ${callPackage ./commands.nix { }}
        ${callPackage ./configs.nix { }}

        colorscheme reki
        hi! Comment      guifg=#5c6370 guibg=NONE gui=italic cterm=italic
        hi! ParenMatch   guifg=#85EB6A guibg=#135B00 gui=NONE cterm=NONE term=reverse ctermbg=11
        set secure
      '';

      vam.knownPlugins = vimPlugins // plugins;
      vam.pluginDictionaries = [
        {
          name = "vim-fugitive";
          tag = "lazy";
        }
        {
          name = "ale";
          tag = "lazy";
        }
        {
          name = "LanguageClient-neovim";
          tag = "lazy";
        }
        {
          name = "deoplete-nvim";
          tag = "lazy";
        }
        {
          name = "vinegar";
          tag = "lazy";
        }
        {
          name = "fzfWrapper";
          tag = "lazy";
        }
        {
          name = "fzf-vim";
          tag = "lazy";
        }
        {
          name = "gitgutter";
          tag = "lazy";
        }
        {
          name = "vim-startify";
          tag = "lazy";
        }
        {
          name = "gv";
          tag = "lazy";
        }
        {
          name = "conflict3";
          tag = "lazy";
        }
        {
          name = "vcs-jump";
          tag = "lazy";
        }
        {
          name = "editorconfig-vim";
          tag = "lazy";
        }
        {
          name = "ferret";
          tag = "lazy";
        }
        {
          name = "commentary";
          tag = "lazy";
        }
        {
          name = "surround";
          tag = "lazy";
        }
        {
          name = "repeat";
          tag = "lazy";
        }
        {
          name = "undotree";
          tag = "lazy";
        }
        {
          name = "wildfire";
          tag = "lazy";
        }
        {
          name = "vim-dispatch";
          tag = "lazy";
        }
        {
          name = "cmdline";
          tag = "lazy";
        }
        {
          name = "vim-edgemotion";
          tag = "lazy";
        }
        {
          name = "targets";
          tag = "lazy";
        }
        {
          name = "vim-submode";
          tag = "lazy";
        }
        {
          name = "vim-parenmatch";
          tag = "lazy";
        }
        {
          name = "quickfix-reflector-vim";
          tag = "lazy";
        }
        {
          name = "vim-easy-align";
          tag = "lazy";
        }
        {
          name = "auto-git-diff";
          tag = "lazy";
        }
        {
          name = "vim-indent-object";
          tag = "lazy";
        }
        {
          name = "apprentice";
          tag = "lazy";
        }
        {
          name = "reki";
          tag = "lazy";
        }
        {
          name = "all-func";
          tag = "lazy";
        }
        {
          name = "vim-nix";
          ft_regex = "^nix$";
          filename_regex = "^.nix$";
        }
        {
          name = "vim-javascript";
          ft_regex = "^javascript$";
          filename_regex = "^.js$";
        }
        {
          name = "yats";
          ft_regex = "^typescript$";
          filename_regex = "^.ts$";
        }
        {
          name = "vim-coffee-script";
          ft_regex = "^coffee$";
        }
        {
          name = "vim-html-template-literals";
          ft_regex = "^javascript$";
        }
        {
          name = "twig";
          ft_regex = "^twig$";
        }
        {
          name = "vim-json";
          ft_regex = "^json$";
          filename_regex = "^.json$";
        }
        {
          name = "vim-jinja";
          ft_regex = "^jinja$";
          filename_regex = "^.jinja$";
        }
        {
          name = "vim-markdown";
          ft_regex = "^markdown$";
          filename_regex = "^.md$";
        }
      ];
    };
  };
}
