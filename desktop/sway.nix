{ config, lib, pkgs, ... }:
let
  waybarConfig =
    pkgs.writeText "config" (pkgs.callPackage ./waybar-config.nix {});
  waybarStyle = pkgs.writeText "config" (builtins.readFile ./waybar.css);
in
{
  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export XKB_DEFAULT_LAYOUT=us
      export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,caps:escape
      export XDG_DATA_DIRS=${
    let
      schema = pkgs.gsettings-desktop-schemas;
    in "${schema}/share/gsettings-schemas/${schema.name}"
    }:$XDG_DATA_DIRS
    '';
    extraPackages = with pkgs; [
      glib
      jmtpfs
      xwayland
      xdg_utils
      wl-clipboard
      dmenu-wayland
      nordic
      paper-icon-theme
      playerctl
    ];
  };

  environment.etc."sway/config".text = with pkgs; ''
    set $term ${alacritty}/bin/alacritty
    set $menu ${dmenu-wayland}/bin/dmenu-wl_run
    set $brightness ${brightnessctl}/bin/brightnessctl
    set $grim ${grim}/bin/grim
    set $mogrify ${imagemagick}/bin/mogrify
    set $slurp ${slurp}/bin/slurp
    set $mako ${mako}/bin/mako
    set $idle ${swayidle}/bin/swayidle
    set $swaylock ${swaylock}/bin/swaylock
    set $lock $grim /tmp/lock.png && $mogrify -scale 10% -scale 1000% /tmp/lock.png && $swaylock -f -i /tmp/lock.png
    set $status ${waybar.override { pulseSupport = true; }}/bin/waybar
    output * bg ${./catalina.jpg} fill
    ${builtins.readFile ./config}
  '';

}
