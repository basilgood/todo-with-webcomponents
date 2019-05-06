{ config, lib, pkgs, ... }:
{
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
    ];
  };

  environment.systemPackages = import ../system-packages.nix pkgs;

}
