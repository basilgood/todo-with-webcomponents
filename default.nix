{ config, lib, pkgs, ... }:
{
  imports = [
    ./local.nix
    ./general.nix
    ./desktop/sway.nix
    ./lf/lf.nix
  ];
}
