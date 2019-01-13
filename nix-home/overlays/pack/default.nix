self: super:
let
  native = self.packNative;
in {
  pack = with self; buildEnv {
    name  = "pack";
    paths = [
      #general
      (native ag)
      (native ripgrep)
      (native fd)
      (native p7zip)
      (native unzip)
      (native zip)
      universal-ctags
      (native unrar)
      fzf
      fzf.out
      xclip
      ntfs3g
      usbutils
      glxinfo
      pciutils
      bat
      lf
      aspell
      mc
      qbittorrent

      # monitoring
      htop

      # audio
      smplayer
      cava

      # office
      # libreoffice-fresh
      unoconv

      # browsers
      firefox
      chromium
      google-chrome
      chromedriver

      # communication
      neomutt
      skypeforlinux
      libnotify
      (weechat.override {configure = {availablePlugins, ...}: {
        plugins = with availablePlugins; [
          (python.withPackages (ps: with ps; [
            websocket_client
          ]))
        ];};
      })

      # accounting
      ledger
      # alacritty

      # editors
      emacs
      (native editorconfig-core-c)
      # (native vim-configured)
      vimHugeX
      # (native emacs)
      # (native import ../vim/vim.nix)
      vim-vint
      (native neovim)

      # file managers
      vifm

      # langs
      nodejs-8_x
      ruby
      yarn

      # misc
      (native keepassxc)

      # git
      (native gitAndTools.tig)
      (native git-lfs)
      (native git)
      gitkraken
      gitAndTools.diff-so-fancy
      # configuration management
      vagrant_2
      redir
      bridge-utils
      ansible_2_6
      avocode
      distrobuilder

      # sway
      termite
      w3m
      i3blocks
      pavucontrol
      mpg123
      dunst
      feh
      i3lock-fancy
      scrot
      # st
    ];
  };
}
