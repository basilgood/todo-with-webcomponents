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
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          lxappearance
          j4-dmenu-desktop
          dmenu
          arc-theme
          arc-icon-theme
          compton
        ];
      };
      default = "i3";
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
