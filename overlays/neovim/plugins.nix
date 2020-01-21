{ pkgs, fetchFromGitHub }:
let
buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
pluginSrc = src: (import src) { inherit
fetchFromGitHub; };
in {
  purescript-vim = buildVimPlugin {
    name = "purescript-vim";
    src = pluginSrc ./plugins/purescript-contrib.purescript-vim.nix;
  };

  # LanguageClient-neovim = buildVimPlugin {
  #   name = "LanguageClient-neovim";
  #   src = pluginSrc ./plugins/autozimu.LanguageClient-neovim.nix;
  # };

  vim-commentary = buildVimPlugin {
    name = "vim-commentary";
    src = pluginSrc ./plugins/tpope.vim-commentary.nix;
  };

  vim-repeat = buildVimPlugin {
    name = "vim-repeat";
    src = pluginSrc ./plugins/tpope.vim-repeat.nix;
  };

  deoplete-nvim = buildVimPlugin {
    name = "deoplete-nvim";
    src = pluginSrc ./plugins/deoplete.nix;
  };

  neovim-fuzzy = buildVimPlugin {
    name = "neovim-fuzzy";
    src = pluginSrc ./plugins/cloudhead.neovim-fuzzy.nix;
  };

  editorconfig-vim = buildVimPlugin {
    name = "editorconfig-vim";
    src = pluginSrc ./plugins/editorconfig.editorconfig-vim.nix;
  };

  neomake = buildVimPlugin {
    name = "neomake";
    src = pluginSrc ./plugins/neomake.neomake.nix;
  };

  vim-javascript = buildVimPlugin {
    name = "vim-javascript";
    src = pluginSrc ./plugins/pangloss.vim-javascript.nix;
  };

  vim-fugitive = buildVimPlugin {
    name = "vim-fugitive";
    src = pluginSrc ./plugins/tpope.vim-fugitive.nix;
  };

  vim-surround = buildVimPlugin {
    name = "vim-surround";
    src = pluginSrc ./plugins/tpope.vim-surround.nix;
  };
}
