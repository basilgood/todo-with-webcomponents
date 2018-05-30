{ config, lib, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};

in {
  imports = [
    ./virtualisation/lxc.nix
    ./virtualisation/lxd.nix
    ./virtualisation/docker.nix
    ./hardware/zram.nix
  ];

  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Bucharest";

  environment.systemPackages = with pkgs; [
    acl
    tree
    wget
    xsel
    p7zip
    lm_sensors
  ];

  programs = {
    tmux.enable = true;
    fish.enable = true;
    ssh.startAgent = true;
  };

  services.xserver = {
    enable = true;

    displayManager.sddm.enable = true;
    desktopManager.xterm.enable = false;
    desktopManager.plasma5.enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
   };

  users = {
    defaultUserShell = "/run/current-system/sw/bin/fish";
    groups.vasy = { gid = 1000; };
    users.vasy = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = ["vasy" "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" "lxd" "docker"];
      initialPassword = "vasy";
    };
  };

}
