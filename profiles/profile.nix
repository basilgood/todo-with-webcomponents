{ config, lib, pkgs, ... }:
{
  imports = [
    ./local.nix
    ./general.nix
#  ../modules/services/X11/gnome3.nix 
# ../modules/services/X11/sway.nix 
# ../modules/services/X11/i3.nix 
    ../X11/qtile.nix 
  ];
}
