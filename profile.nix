{ config, lib, pkgs, ... }:
{
  imports = [
    ./local.nix
    ./general.nix
    # ./system-packages.nix
    # ../desktop/i3.nix
    ./desktop/sway.nix
  ];
}
