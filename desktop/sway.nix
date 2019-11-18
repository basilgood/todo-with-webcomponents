{ config, lib, pkgs, ... }:
let
  waybarConfig =
    pkgs.writeText "config" (pkgs.callPackage ./waybar-config.nix { });
  waybarStyle = pkgs.writeText "config" (builtins.readFile ./waybar.css);
in {
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export XKB_DEFAULT_LAYOUT=us
      export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,caps:escape
    '';
    extraPackages = with pkgs; [
      glib
      swayidle
      swaylock
      grim
      slurp
      mako
      xwayland
      xdg_utils
      wl-clipboard
    ];
  };

  environment.etc."sway/config".text = with pkgs; ''
    set $term ${kitty}/bin/kitty
    set $menu ${j4-dmenu-desktop}/bin/j4-dmenu-desktop
    set $brightness ${brightnessctl}/bin/brightnessctl
    set $grim ${grim}/bin/grim
    set $mogrify ${imagemagick}/bin/mogrify
    set $slurp ${slurp}/bin/slurp
    set $xclip ${xclip}/bin/xclip
    set $mako ${mako}/bin/mako
    set $swaylock ${swaylock}/bin/swaylock
    set $status ${waybar.override { pulseSupport = true; }}/bin/waybar
    output * bg ${./Mohave.jpg} fill
    ${builtins.readFile ./config}
  '';

}
