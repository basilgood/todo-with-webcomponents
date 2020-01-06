self: super: {
  pack = with self;
    buildEnv {
      name = "pack";
      paths = [
        aspell
        aspellDicts.en
        tree
        htop
        xclip
        p7zip
        unzip
        lm_sensors
        keepassxc
        pavucontrol
        # fzy
        bat
        # fd
        # ag
        file
        mupdf
        pciutils
        mimeo
        # nixfmt
        # ueberzug
        # popcornTime
        # skypeforlinux
        # teamviewer

        # nodePackages.ungit
        # nodePackages.node2nix
        # nodePackages.bash-language-server
        nodePackages.typescript
        nodePackages.eslint
        nodePackages.typescript-language-server
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin
        # nodePackages.dockerfile-language-server-nodejs

        chromium
        firefox

        j4-dmenu-desktop
        lazygit

        # nerdfont_dejavu
        alacritty
        tmuxPlugins.resurrect
        tmuxPlugins.sensible
        tmuxPlugins.prefix-highlight
        tmuxPlugins.pain-control
        # kitty

	      vim_one
        neovim
        editorconfig-core-c
        kak
        # hnix-lsp

        vim-vint
        python37Packages.yamllint

        kodiPlain
        spotify
        mpv
        moc
        feh
      ];
    };
}
