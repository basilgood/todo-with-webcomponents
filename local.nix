{ config, lib, pkgs, ... }: {
  users = {
    groups.vasy = { gid = 1000; };
    users.vasy = {
      isNormalUser = true;
      createHome = true;
      home = "/home/vasy";
      uid = 1000;
      extraGroups = [
        "vasy"
        "wheel"
        "disk"
        "audio"
        "video"
        "networkmanager"
        "systemd-journal"
        "lxd"
        "docker"
        "vboxusers"
        "sway"
      ];
      initialPassword = "vasy";
      useDefaultShell = true;
      shell = "/run/current-system/sw/bin/bash";
      packages = with pkgs; [

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

        xwayland

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
  };
}
