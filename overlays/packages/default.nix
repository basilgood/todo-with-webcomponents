self: super: {
  myNodePackages = super.pkgs.callPackage ../../node-packages { };
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
        # popcornTime
        skypeforlinux
        teamviewer

        nodePackages.node2nix
        nodePackages.bash-language-server
        nodePackages.typescript
        nodePackages.eslint
        nodePackages.typescript-language-server
        nodePackages.dockerfile-language-server-nodejs

        nix-npm-install
        chromium
        firefox

        j4-dmenu-desktop
        lazygit

        st

        vimHugeX
        neovim
        editorconfig-core-c
        vscode
        emacs
        # hnix-lsp

        vim-vint
        python37Packages.yamllint
        # python27Packages.docker
        # python37Packages.docker

        spotify
        mpv
        moc
        feh
      ];
    };
}
