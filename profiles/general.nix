{ config, lib, pkgs, ... }:
{
  imports = [
    # config
    ../virtualisation/lxc.nix
    ../virtualisation/lxd.nix
    ../virtualisation/virtualbox.nix
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
    tmux.enable = true;
    # zsh.enable = true;
    java.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;

    # cpu.intel.updateMicrocode = true;
    cpu.amd.updateMicrocode = true;

    # opengl.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/bash";

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
