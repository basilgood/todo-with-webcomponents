self: super:

let
  buildEnv = self.buildEnv;
  native = self.plumNative;
in {
  plumelo = with self; buildEnv {
    name  = "plumelo";
    paths = [
      #general
      ag
      ripgrep
      fd
      p7zip

      # audio
      python35Packages.mps-youtube
      python35Packages.youtube-dl
      mpv
      mplayer
      cava

      # office
      libreoffice-fresh
      unoconv

      # browsers
      firefox
      chromium
      chromedriver

      # communication
      skypeforlinux

      # accounting
      ledger

      # editors
      (native editorconfig-core-c)
      (native vim_plum)
      vim-vint
      neovim
      python27Packages.neovim
      python36Packages.neovim
      python27Packages.yamllint

      # terminals

      # file managers
      vifm
      ranger

      # langs
      (native nodejs-8_x) 
      (native ruby_2_3)

      # misc
      taskwarrior

      # git
      gitAndTools.tig
      git-lfs
      gitkraken_latest
      gitAndTools.diff-so-fancy

      # configuration management
      vagrant_2
      redir
      bridge-utils
      ansible_2_4
      ansible-lint
      python27Packages.pyyaml
      python36Packages.pyyaml
    ];
  };
}
