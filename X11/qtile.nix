{ config, lib, pkgs, ... }:
{

  environment.systemPackages = with pkgs;
  [
      enlightenment.terminology
      arc-theme
      arc-icon-theme
      compton
  ];
  services.xserver = {
    enable = true;

    displayManager.lightdm = {
      enable = true;
    };

    desktopManager.xterm.enable = false;
    desktopManager.default = "none";

    windowManager.qtile.enable = true;

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
