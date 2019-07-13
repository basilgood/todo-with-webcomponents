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
        pack
      ];

    };
  };
}
