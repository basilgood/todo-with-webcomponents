self: super: {
  pack = with self;
  buildEnv {
    name = "pack";
    paths = [
      tree
      htop
      xclip
      p7zip
      unzip
      lm_sensors
      keepassxc
      pavucontrol
      fzy
      fzf
      bat
      fd
      ag
      fasd
      file
      mupdf
      pciutils
      mimeo
      nixfmt
      popcornTime

      chromium
      firefox

      j4-dmenu-desktop

      st

      vimHugeX
      editorconfig-core-c
      gimp-with-plugins

      vim-vint
      python37Packages.yamllint

      spotify
      mpv
      moc
      feh
    ];
  };
}
