{ config, lib, pkgs, ... }:
{

  services.xserver = {
    enable = true;

    displayManager.lightdm = {
      enable = true;
    };

    desktopManager.xterm.enable = false;
    desktopManager.default = "none";

    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          enlightenment.terminology
          j4-dmenu-desktop
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

  services.udev.packages = with pkgs; [
    brightnessctl
      android-udev-rules
  ];

  programs.ssh.startAgent = true;

}
