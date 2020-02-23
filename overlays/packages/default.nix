self: super: {
  pack = with self;
    buildEnv {
      name = "pack";
      paths = [
        aspell
        aspellDicts.en
        tree
        htop
        p7zip
        unzip
        unrar
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

        nodePackages.typescript
        nodePackages.eslint
        nodePackages.typescript-language-server
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin

        brave
        chromium
        firefox

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
        emacs

        vim-vint
        python37Packages.yamllint

        spotify
        mpv
        moc
        feh
      ];
    };
}
