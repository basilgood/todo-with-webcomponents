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

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.kernelModules = ["coretemp"];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "merlin"; # Define your hostname.
  networking.networkmanager.enable = true;

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
    zsh.enable = true;
    ssh.startAgent = true;
  };

  services.xserver = {
    enable = true;

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";

   };

  users = {
    defaultUserShell = "/run/current-system/sw/bin/zsh";
    groups.vasy = { gid = 1000; };
    users.vasy = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = ["vasy" "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" "lxd" "docker"];
      initialPassword = "vasy";
    };
  };

}
