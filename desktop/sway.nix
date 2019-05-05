{ config, lib, pkgs, ... }:
let
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
in {
  nixpkgs.overlays = [ waylandOverlay ];
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export XKB_DEFAULT_LAYOUT=us
      export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,caps:escape
    '';
    extraPackages = with pkgs; [
      swayidle
      swaylock
      waybar
      grim
      slurp
      mako
      redshift-wayland
      xdg-desktop-portal-wlr
    ];
  };

  environment.systemPackages = import ../system-packages.nix pkgs;

}
