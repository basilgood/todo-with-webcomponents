{ config, lib, pkgs, ... }:
let
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
in
  {
    nixpkgs.overlays = [ waylandOverlay ];
    programs.sway.enable = true;
    programs.sway.extraPackages = with pkgs; [
      swayidle # used for controlling idle timeouts and triggers (screen locking, etc)
      swaylock # used for locking Wayland sessions

      waybar        # polybar-alike

      grim     # screen image capture
      slurp    # screen are selection tool
      mako     # notification daemon
      # wlstream # screen recorder
      # oguri    # animated background utility
      # kanshi   # dynamic display configuration helper
      redshift-wayland # patched to work with wayland gamma protocol

      xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
    ];

    environment.systemPackages = with pkgs; [
      xwayland
      chromium
      firefox-wayland
      j4-dmenu-desktop
      # wayfire  # 3D wayland compositor
      # waybox   # An openbox clone on Wayland
      # bspwc    # Wayland compositor based on BSPWM
    ];

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
