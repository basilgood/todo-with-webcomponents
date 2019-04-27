{ config, lib, pkgs, ... }:
{

  services.xserver = {
    enable = true;

    displayManager.slim = {
      enable = true;
    };

    desktopManager.xterm.enable = false;
    desktopManager.default = "none";

    windowManager = {
      qtile = {
        enable = true;
      };
      default = "qtile";
    };

    layout = "us";
    xkbOptions = "eurosign:e, caps:escape";

    libinput.enable = true;
  };

  networking = {
    networkmanager.enable = true;
  };

  services.upower.enable = true;
  services.udev.packages = with pkgs; [
    brightnessctl
    android-udev-rules
  ];

  programs.ssh.startAgent = true;

}
