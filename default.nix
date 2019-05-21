{ config, lib, pkgs, ... }:
{
  imports = [
    ./local.nix
    ./general.nix
    ./desktop/sway.nix
    ./programs/default.nix
  ];
}