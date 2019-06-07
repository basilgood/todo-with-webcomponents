self: super:
with super;

let
  plugins = callPackage ./plugins/default.nix {};
in {
  neovim-unwrapped = (neovim-unwrapped
  .override {
    stdenv= gcc9Stdenv;
  })
  .overrideAttrs(old: rec {
    name = "neovim-unwrapped-${version}";
    version = "0.4.0-dev";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "c6cd6081b8c449fa9890c18b5e2151e3af9bd45d";
      sha256 = "1v978z88ikw3lldd5y8zsdyy9rzciwy10q298z0s8m4aal8612bs";
    };
    NIX_CFLAGS_COMPILE = "-O3 -march=native";
  });

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

        ${ callPackage ./options.vim.nix {}}
        ${ callPackage ./mappings.vim.nix {}}
        ${ callPackage ./autocmds.vim.nix {}}
        ${ callPackage ./configs.vim.nix {}}

        syntax enable
        filetype plugin indent on

        set background=dark
        colorscheme onehalfdark
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          fugitive
          lightline-vim
          vinegar
          vim-nix
        ];
        opt = [
          ale
          ack-vim
          commentary
          surround
          repeat
          vim-highlightedyank
          vim-signify
          editorconfig-vim
          vim-eunuch
          vim-coffee-script
          vim-jinja
          vim-markdown
        ]++ (with plugins; [
          starsearch
          onehalfdark
          quickfix
          javascript_syntax
          jsx
          html_template
          yats
          twig
        ]);
      };
    };
  };
}
