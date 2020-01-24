{ pkgs, fetchFromGitHub }:
let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
  pluginSrc = src: (import src) {
    inherit
      fetchFromGitHub
      ;
  };
in
{
  nvimlsp = buildVimPlugin {
    pname = "nvim-lsp";
    src = pluginSrc ./plugins/nvim-lsp.nix;
  };
  ale = buildVimPlugin {
    name = "ale";
    src = pluginSrc ./plugins/ale.nix;
  };
  deoplete = buildVimPlugin {
    name = "deoplete.nvim";
    src = pluginSrc ./plugins/deoplete.nix;
  };
  deoplete-lsp = buildVimPlugin {
    name = "deoplete-lsp";
    src = pluginSrc ./plugins/deoplete-lsp.nix;
  };
  vimfugitive = buildVimPlugin {
    name = "vim-fugitive";
    src = pluginSrc ./plugins/fugitive.nix;
  };
  dispatch = buildVimPlugin {
    name = "vim-dispatch";
    src = pluginSrc ./plugins/dispatch.nix;
  };
  neovimfuzzy = buildVimPlugin {
    name = "neovim-fuzzy";
    src = pluginSrc ./plugins/neovim-fuzzy.nix;
  };
  leaderf = buildVimPlugin {
    name = "LeaderF";
    src = pluginSrc ./plugins/leaderf.nix;
  };
  sgureditorconfig = buildVimPlugin {
    name = "vim-editorconfig";
    src = pluginSrc ./plugins/vim-editorconfig.nix;
  };
  hlyank = buildVimPlugin {
    name = "hlyank.vim";
    src = pluginSrc ./plugins/hlyank.nix;
  };
  vim-async-grep = buildVimPlugin {
    name = "vim-async-grep";
    src = pluginSrc ./plugins/vim-async-grep.nix;
  };
  conflict-marker = buildVimPlugin {
    name = "conflict-marker.vim";
    src = pluginSrc ./plugins/conflict-marker.nix;
  };
  vimjavascript = buildVimPlugin {
    name = "vim-javascript";
    src = pluginSrc ./plugins/vim-javascript.nix;
  };
  lithtml = buildVimPlugin {
    name = "vim-html-template-literals";
    src = pluginSrc ./plugins/lithtml.nix;
  };
  vim-pug = buildVimPlugin {
    name = "vim-pug";
    src = pluginSrc ./plugins/vim-pug.nix;
  };
  vim-pug-complete = buildVimPlugin {
    name = "vim-pug-complete";
    src = pluginSrc ./plugins/vim-pug-complete.nix;
  };
  vim-fixjson = buildVimPlugin {
    name = "vim-fixjson";
    src = pluginSrc ./plugins/vim-fixjson.nix;
  };
}
