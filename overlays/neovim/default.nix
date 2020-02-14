self: super:
with super;
with lib;
let
  lsp = import ../lsp self super;
  nixfmt = import ../nixfmt self super;
  extraPlugins = callPackage ./plugins.nix {};

  neovimConfig = {
    customRC = ''
      ${builtins.readFile ./config/init.vim};
      ${builtins.readFile ./config/options.vim};
      ${builtins.readFile ./config/mappings.vim};
      ${builtins.readFile ./config/commands.vim};
      ${builtins.readFile ./config/autocmds.vim};

      colorscheme xcodedark
      hi Normal guifg=#c3d5ec guibg=#1e222c ctermfg=252 ctermbg=235
      hi EndOfBuffer guifg=#c3d5ec guibg=#1e222c ctermfg=252 ctermbg=235
      hi MatchParen guifg=#f78c6c guibg=#111111 gui=bold ctermbg=NONE cterm=bold
      hi StatusLine guifg=#dfdfe0 guibg=#40614f guisp=NONE gui=NONE cterm=NONE
      hi Comment guifg=#7f8c98 guibg=NONE guisp=NONE gui=italic cterm=NONE
      hi String ctermfg=44 ctermbg=NONE cterm=NONE guifg=#007878 guibg=NONE gui=NONE
      hi GitGutterAdd guifg=#22a17b ctermfg=22
      hi GitGutterChange guifg=#abb81c ctermfg=142
      hi GitGutterDelete guifg=#bd286b ctermfg=9
      hi GitGutterChangeDelete guifg=#bd286b ctermfg=9
      hi ALEWarningSign guifg=#adb53f ctermfg=yellow ctermbg=NONE
      hi ALEErrorSign guifg=#bd286b ctermfg=red ctermbg=NONE

      set secure
    '';
    plugins = with vimPlugins // extraPlugins; [
      {
        start = coc-nvim;
        config = ''
          let g:coc_user_config = {
            \ 'coc.preferences.colorSupport': v:true,
            \ 'coc.preferences.extensionUpdateCheck': 'never',
            \ 'suggest.minTriggerInputLength': 2,
            \ 'suggest.timeout': 500,
            \ 'suggest.removeDuplicateItems': v:true,
            \ 'suggest.floatEnable': v:true,
            \ 'suggest.triggerCompletionWait': 100,
            \ 'diagnostic': {
            \     'displayByAle': v:true,
            \     'virtualText': v:true
            \ },
            \ 'javascript.suggestionActions.enabled': v:false,
            \ 'typescript.suggestionActions.enabled': v:true,
            \ 'languageserver': {
            \     'viml': {
            \         'command': 'vim-language-server',
            \         'args': [
            \             "--stdio"
            \         ],
            \         'filetypes': [
            \             "vim"
            \         ],
            \         'initializationOptions': {
            \             'vimlcodeCompletionEnabled': v:true,
            \             'lintTool': "vint"
            \         }
            \     },
            \     'javascript': {
            \         'command': "typescript-language-server",
            \         'args': [
            \             '--stdio'
            \         ],
            \         'filetypes': [
            \             'javascript',
            \             'typescript'
            \         ]
            \     },
            \     'html': {
            \         'command': 'html-languageserver',
            \         'args': [
            \             '--stdio'
            \         ],
            \         'filetypes': [
            \             'html'
            \         ]
            \     },
            \     'css': {
            \         'command': 'css-languageserver',
            \         'args': [
            \             '--stdio'
            \         ],
            \         'filetypes': [
            \             'css',
            \             'scss'
            \         ]
            \     }
            \ }
          \ }
          nmap <silent> gld <Plug>(coc-definition)
          nmap <silent> gli <Plug>(coc-implementation)
          nmap <silent> glr <Plug>(coc-references)
          nmap <silent> glc <Plug>(coc-codeaction)
          nmap <silent> [g <Plug>(coc-diagnostic-prev)
          nmap <silent> ]g <Plug>(coc-diagnostic-next)
          nmap <silent> [c <Plug>(coc-git-prevchunk)
          nmap <silent> ]c <Plug>(coc-git-nextchunk)
          nnoremap <silent> K :call CocAction('doHover')<cr>
          command! -nargs=0 Format :call CocAction('format')
          command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
        '';
      }
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
        opt = xcode;
        config = "";
      }
      {
        opt = fzfWrapper;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd fzfWrapper'
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
          let g:ale_javascript_prettier_options = '--single-quote'
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
        opt = vim-indent-object;
        config = ''
          autocmd vimRc BufReadPost *
                \ execute 'packadd vim-indent-object'
        '';
      }
      {
        opt = undotree;
        config = ''
          let g:undotree_CustomUndotreeCmd = 'vertical 50 new'
          let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
          let g:undotree_SetFocusWhenToggle = 1
          let g:undotree_ShortIndicators = 1
          command! UT packadd undotree | UndotreeToggle
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
        opt = cmdline-completion;
        config = ''
          autocmd vimRc CmdlineEnter *
                \ execute 'packadd cmdline-completion'
        '';
      }
      {
        opt = vim-javascript;
        config = ''
          autocmd vimRc BufReadPre *.js,*.jsx
                \ execute 'packadd vim-javascript'
        '';
      }
      {
        start = vim-pairify;
        config = "";
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
  neovim-unwrapped = (neovim-unwrapped).overrideAttrs
    (
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
          wrapProgram $out/bin/nvim --prefix PATH : ${makeBinPath
          [
            ag
            fzf
            git
            lsp.js.vim-language-server
            lsp.js.fixjson
            nodePackages.eslint
            nodePackages.eslint_d
            nodePackages.prettier
            nodePackages.typescript
            nodePackages.typescript-language-server
            nodePackages.vscode-html-languageserver-bin
            nodePackages.vscode-css-languageserver-bin
            nixfmt.nixpkgs-fmt
            editorconfig-core-c
          ]}
        '';
      }
    );

  neovim = (
    neovim.override {
      withNodeJs = true;
      configure = fun neovimConfig;
    }
  ).overrideAttrs
    (
      old: rec {
        buildCommand = ''
          export HOME=$TMPDIR
        '' + old.buildCommand;
      }
    );
}
