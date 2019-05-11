{ config, lib, pkgs, ... }:
{
  imports = [
    ./local.nix
    ./general.nix
    ./desktop/sway.nix
    ./tmux.nix
    ./lf.nix
  ];
}
