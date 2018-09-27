{ config, lib, pkgs, ... }:
{
  imports = [
    # all new pkgs and/or overlays
    # ../pkgs/all.nix

    # config
    ../modules/virtualisation/lxc.nix
    ../modules/virtualisation/lxd.nix
    # ../modules/hardware/ssd.nix
    # ../modules/hardware/zram.nix
  ];

  nix.buildCores = 0;
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
    zsh.enable = true;
    java.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;

    # cpu.intel.updateMicrocode = true;
    cpu.amd.updateMicrocode = true;

    opengl.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
  };

  boot = {
    kernelModules = [
      "coretemp"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
  
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
