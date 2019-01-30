{ config, lib, pkgs, ... }:
{

  nixpkgs.config.packageOverrides = pkgs: {
    dwm = pkgs.dwm.override {
      patches =
        [
          ./dwm-gaplessgrid-6.1.diff
          ./dwm-fancybarclickable-6.1.diff
          ./dwm-6.1-systray.diff
          ./dwm-activetagindicatorbar-6.1.diff
          ./dwm-gridmode-5.8.2.diff
          ./dwm-attachaside-6.1.diff
          ./dwm-combo-6.1.diff
          ./dwm-noborder-6.1.diff
      ];
      };
    };

    services.xserver = {
      enable = true;

      displayManager.slim = {
        enable = true;
      };

      windowManager = {
        dwm = {
          enable = true;
        };
      };

      desktopManager = {
        default = "none";
        xterm.enable = false;
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
