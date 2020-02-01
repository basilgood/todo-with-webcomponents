self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
  extraPlugins = callPackage ./plugins.nix {};

  neovimConfig = {
    customRC = ''
      ${builtins.readFile ./config/init.vim};
      ${builtins.readFile ./config/options.vim};
      ${builtins.readFile ./config/mappings.vim};
      ${builtins.readFile ./config/commands.vim};
      ${builtins.readFile ./config/autocmds.vim};
      ${builtins.readFile ./config/colorscheme.vim};
      set secure
    '';
    plugins = with vimPlugins // extraPlugins; [
      {
        start = gitgutter;
        config = ''
          let g:gitgutter_sign_priority = 8
          let g:gitgutter_override_sign_column_highlight = 0
          let g:gitgutter_sign_added              = '|'
          let g:gitgutter_sign_modified           = '|'
          nmap ghs <Plug>(GitGutterStageHunk)
          nmap ghu <Plug>(GitGutterUndoHunk)
          nmap ghp <Plug>(GitGutterPreviewHunk)
        '';
      }
      {
        start = repeat;
        config = "";
      }
      {
        start = quickfix-reflector-vim;
        config = "";
      }
      {
        start = fzf-vim;
        config = ''
          let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
          let g:fzf_layout = { 'down': '~25%' }
          let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-s': 'split',
                \ 'ctrl-v': 'vsplit',
                \ 'ctrl-w': 'bdelete'}
          nnoremap <c-p> :Files<cr>
          nnoremap <c-h> :Files %:h<cr>
          nnoremap <bs> :Buffers<cr>
        '';
      }
      {
        opt = vinegar;
        config = ''
          autocmd vimRc BufEnter * execute 'packadd vim-vinegar'
          let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
          let g:netrw_altfile             = 1
          function! Innetrw() abort
            nmap <buffer> <right> <cr>
            nmap <buffer> <left> -
            nmap <buffer> gq :bn<bar>bd#<cr>
            nmap <buffer> D .!rm -rf
          endfunction
          autocmd vimRc FileType netrw call Innetrw()
        '';
      }
      {
        opt = fzfWrapper;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd fzfWrapper'
        '';
      }
      {
        opt = deoplete;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd deoplete.nvim'
          let g:deoplete#enable_at_startup = 1
        '';
      }
      {
        opt = deoplete-lsp;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd deoplete-lsp'
        '';
      }
      {
        opt = nvim-lsp;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd nvim-lsp'
          lua << EOF
          if not package.loaded.nvim_lsp then
            vim.cmd 'packadd nvim-lsp'
            vim._update_package_paths()
          end
          local nvim_lsp = require'nvim_lsp'
          nvim_lsp.tsserver.setup {
            cmd = {'typescript-language-server', '--stdio'},
            filetypes = { 'javascript', 'typescript' }
          }
          nvim_lsp.vimls.setup {
            cmd = {'vim-language-server', '--stdio'},
            filetypes = { 'vim' }
          }
          EOF
        '';
      }
      {
        opt = ale;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd ale'
          let g:ale_set_signs = 1
          let g:ale_lint_on_text_changed = 'normal'
          let g:ale_lint_on_insert_leave = 1
          let g:ale_lint_delay = 0
          let g:ale_code_actions_enabled = 1
          let g:ale_sign_info = '_i'
          let g:ale_sign_error = '_e'
          let g:ale_sign_warning = '_w'
          let g:ale_set_balloons = 1
          let g:ale_javascript_eslint_use_global = 1
          let g:ale_javascript_eslint_executable = 'eslint_d'
          let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
          let g:ale_echo_msg_format = '%linter%: %s %severity%'
          let g:ale_linters = {
                \   'jsx': ['eslint'],
                \   'javascript': ['eslint'],
                \   'typescript': ['eslint'],
                \}
          let g:ale_fixers = {
                \   'javascript': ['prettier', 'eslint'],
                \   'html': ['prettier', 'eslint'],
                \   'yaml': ['prettier'],
                \   'nix': ['nixpkgs-fmt']
                \}
          nnoremap [a :ALEPreviousWrap<CR>
          nnoremap ]a :ALENextWrap<CR>
        '';
      }
      {
        opt = vimfugitive;
        config = ''
          autocmd vimRc BufReadPre *
                \ execute 'packadd vim-fugitive'
          nnoremap [git]  <Nop>
          nmap <space>g [git]
          nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
          nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>
          function! InFugitive() abort
            nmap <buffer> zp :<c-u>Dispatch! git push<CR>
            nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
          endfunction
          autocmd vimRc FileType fugitive call InFugitive()
        '';
      }
      {
        opt = dispatch;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-dispatch'
        '';
      }
      {
        opt = sgureditorconfig;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-editorconfig'
          let g:editorconfig_root_chdir = 1
          let g:editorconfig_verbose    = 1
          let g:editorconfig_blacklist  = {
                \ 'filetype': ['git.*', 'fugitive'],
                \ 'pattern': ['\.un~$']}
        '';
      }
      {
        opt = easy-align;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-easy-align'
          nmap ga <Plug>(EasyAlign)
          xmap ga <Plug>(EasyAlign)
        '';
      }
      {
        opt = vim-surround;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-surround'
          let surround_indent=1
          nmap S ysiw
        '';
      }
      {
        opt = tcomment_vim;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd tcomment_vim'
        '';
      }
      {
        opt = hlyank;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd hlyank.vim'
        '';
      }
      {
        opt = targets-vim;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd targets-vim'
        '';
      }
      {
        opt = vim-async-grep;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-async-grep'
        '';
      }
      {
        opt = vim-mergetool;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-mergetool'
          let g:mergetool_layout = 'bmr'
          nmap [git]m <plug>(MergetoolToggle)
        '';
      }
      {
        opt = conflict-marker;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd conflict-marker.vim'
        '';
      }
      {
        opt = auto-git-diff;
        config = ''
          autocmd vimRc FileType gitrebase
                \ execute 'packadd auto-git-diff'
        '';
      }
      {
        opt = vim-smoothie;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-smoothie'
        '';
      }
      {
        opt = vimjavascript;
        config = ''
          autocmd vimRc BufReadPre *.js,*.jsx
                \ execute 'packadd vim-javascript'
        '';
      }
      {
        opt = lithtml;
        config = ''
          autocmd vimRc BufReadPre *.js,*.jsx
                \ execute 'packadd vim-html-template-literals'
          let g:htl_all_templates = 1
          let g:htl_css_templates = 1
        '';
      }
      {
        opt = vim-pug;
        config = ''
          autocmd vimRc BufReadPre *.pug
                \ execute 'packadd vim-pug'
        '';
      }
      {
        opt = vim-pug-complete;
        config = ''
          autocmd vimRc BufReadPre *.pug
                \ execute 'packadd vim-pug-complete'
        '';
      }
      {
        opt = vim-coffee-script;
        config = ''
          autocmd vimRc BufReadPre *.coffee
                \ execute 'packadd vim-coffee-script'
        '';
      }
      {
        opt = vim-markdown;
        config = ''
          autocmd vimRc BufReadPre *.md
                \ execute 'packadd vim-markdown'
        '';
      }
      {
        opt = vim-jinja;
        config = ''
          autocmd vimRc BufReadPre *.jinja
                \ execute 'packadd vim-jinja'
        '';
      }
      {
        opt = vim-twig;
        config = ''
          autocmd vimRc BufReadPre *.twig
                \ execute 'packadd vim-twig'
        '';
      }
      {
        opt = vim-fixjson;
        config = ''
          autocmd vimRc BufReadPre *.json
                \ execute 'packadd vim-fixjson'
        '';
      }
      {
        opt = vim-nix;
        config = ''
          autocmd vimRc BufReadPre *.nix
                \ execute 'packadd vim-nix'
        '';
      }
    ];
  };

  # fun neovimConfig
  fun = cfg: {
    packages.myVimPackage = {
      start = map (item: item.start) (builtins.filter (check: check ? "start") cfg.plugins);
      opt = map (item: item.opt) (builtins.filter (check: check ? "opt") cfg.plugins);
    };
    customRC = cfg.customRC + "\n" + concatMapStringsSep "\n" (george: george.config) cfg.plugins;
  };

in
{
  neovim-unwrapped = (neovim-unwrapped).overrideAttrs (
    old: rec {
      name = "neovim-unwrapped-${version}";
      version = "nightly";
      src = fetchFromGitHub {
        owner = "neovim";
        repo = "neovim";
        rev = "97dcc48c998ccecaa37a3cbea568d85c2f1407f9";
        sha256 = "1cnqmgfa33k6x0rbx5dhdqn1819rsggrwr0l4xwia8awbiwq93ym";
      };
      nativeBuildInputs = old.nativeBuildInputs ++ [ utf8proc makeWrapper ];
      postInstall = old.postInstall + ''
        wrapProgram $out/bin/nvim --prefix PATH : ${
      makeBinPath [
        ag
        fzf
        git
        lsp.js.vim-language-server
        lsp.js.import-js
        lsp.js.diagnostic-languageserver
        lsp.js.fixjson
        nodePackages.typescript
        nodePackages.eslint
        nodePackages.eslint_d
        nodePackages.prettier
        nodePackages.typescript-language-server
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin
        nixpkgs-fmt
        nixfmt
        editorconfig-core-c
      ]
      }
      '';
    }
  );

  neovim = (
    neovim.override {
      withNodeJs = true;
      configure = fun neovimConfig;
    }
  ).overrideAttrs (
    old: rec {
      buildCommand = ''
        export HOME=$TMPDIR
      '' + old.buildCommand;
    }
  );
}
