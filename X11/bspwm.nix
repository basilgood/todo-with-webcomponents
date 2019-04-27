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
      bspwm = {
        enable = true;
        configFile = "/home/vasy/.config/bspwm/bspwmrc";
        sxhkd.configFile= "/home/vasy/.config/bspwm/sxhkdrc";
      };
      default = "bspwm";
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

  services.xrdp.defaultWindowManager = "bspwm";

  programs.ssh.startAgent = true;

}
