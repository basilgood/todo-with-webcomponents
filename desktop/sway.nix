{ config, lib, pkgs, ... }:
let
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
  waybarConfig = pkgs.writeText "config" (builtins.readFile ./waybar-config);
  waybarStyle = pkgs.writeText "config" (builtins.readFile ./waybar.css);
in {
  nixpkgs.overlays = [ waylandOverlay ];
  programs.sway.enable = true;
  programs.sway.extraPackages = with pkgs; [
    swayidle
    swaylock
    waybar
    grim
    slurp
    mako
    redshift-wayland
    xdg-desktop-portal-wlr
  ];

  environment.systemPackages = import ../system-packages.nix pkgs;

  environment.etc."sway/config".text = with pkgs; ''
    set $status ${waybar}/bin/waybar -c ${waybarConfig} -s ${waybarStyle}
    ${builtins.readFile ./config}
    '';
}
