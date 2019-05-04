{ config, lib, pkgs,options, ... }:

{

  nixpkgs.overlays = [
    (import ../overlays/lxd)
  ];

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
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ libvdpau-va-gl vaapiVdpau ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/bash";

  networking.networkmanager = {
    dns = "dnsmasq";
    dynamicHosts =  {
      enable = true;
    };
  };

  environment.etc."NetworkManager/dnsmasq.d/10-dns-lxcd.conf".text = ''
      server=/local/10.0.3.1
      server=/lxd/10.0.4.1
  '';

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      inconsolata
      unifont
      ubuntu_font_family
      symbola
      nerdfonts
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
