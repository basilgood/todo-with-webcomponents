{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {

    all = with pkgs; buildEnv {
      name = "all";

      paths = [

        telnet

        zsh
        termite
        powerline-fonts

        gnumake
        gcc
        lm_sensors
        lsof

        tree
        ripgrep
        fd
        mc
        ranger
        atom
        jupp
        emacs25-nox
        ag
        ack
        ripgrep
        xsel

        gitMinimal
        meld
        tig
        tmux

        zip
        unzip
        p7zip
        wget

        firefoxWrapper
        chromium

        gimp

        nodejs-8_x

        go

        python27
        jenkins
        python27Packages.virtualenv
        python27Packages.yamllint
        libyaml
        vim-vint
        zlib

        gparted
        vagrant
        ansible2
        libreoffice-fresh
        ruby
        bundler

        mpv
        smplayer
        smtube

      ];
    };
  };
}

