{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {
    termite-config = import ./termite-config {
      inherit (pkgs) stdenv;
      vte = gnome3.vte;
    };

    bash-config = import ./bash-config {
      inherit (pkgs) stdenv;
    };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        termite-config

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

