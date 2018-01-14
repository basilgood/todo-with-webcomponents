{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {

    all = with pkgs; buildEnv {
      name = "all";

      paths = [

        telnet
        keepassx-community

        neovim
        python36Packages.neovim
        editorconfig-core-c

        zsh
        termite
        tmux
        alacritty
        powerline-fonts

        gnumake
        gcc
        lm_sensors
        lsof

        tree
        ripgrep
        fd
        fasd
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
        python27Packages.virtualenvwrapper
        python27Packages.pip
        python27Packages.setuptools
        python27Packages.setuptools_scm
        python27Packages.setuptools-git
        python27Packages.yamllint
        libyaml
        ocamlPackages.ocaml_ssl
        python27Packages.cffi
        python27Packages.pynacl
        python27Packages.pyopenssl
        python27Packages.paramiko
        python27Packages.pyopenssl
        libffi
        python36Packages.virtualenv
        python36Packages.virtualenvwrapper
        python36Packages.pip
        python36Packages.setuptools
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

