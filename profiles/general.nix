{ config, lib, pkgs, ... }:
{
  imports = [
    ../virtualisation/lxc.nix
    ../virtualisation/lxd.nix
    # ../virtualisation/virtualbox.nix
  ];

  nix.buildCores = 4;
  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  powerManagement = {
    enable = true;
  };

  programs = {
    # tmux.enable = true;
    java.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;

    cpu.amd.updateMicrocode = true;

    # opengl.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/bash";

  fonts = {
    fonts = with pkgs; [
      corefonts
      font-awesome-ttf
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
      helvetica-neue-lt-std
    ];
  };

  environment.systemPackages = with pkgs; [
    # common
    acl
    tree
    wget
    xclip
    p7zip
    lm_sensors
  ];
}
