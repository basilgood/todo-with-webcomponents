{ config, lib, pkgs,options, ... }:
with builtins;
let
  overlaysPath = ../overlays;
  isDir = path: pathExists (path + "/.");
  overlays = path:
    if isDir path then
      let content = readDir path; in
        map
          (n: import (path + ("/" + n)))
          (filter
            (n: match ".*\\.nix" n != null || pathExists (path + ("/" + n + "/default.nix")))
            (attrNames content)
          )
    else
      import path;
in
{
  nix = {
    nixPath =
      options.nix.nixPath.default ++
    ["nixpkgs-overlays=${toString overlaysPath}"];
  };

  nixpkgs.overlays = [
    (self: super:
      lib.foldl (p: n: p  // n self super) ({}) (overlays overlaysPath)
    )
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

    # opengl.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
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
