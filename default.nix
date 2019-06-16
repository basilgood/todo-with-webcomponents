{ config, lib, pkgs, ... }:
{
  imports = [
    ./local.nix
    ./general.nix
    ./zsh/zsh.nix
    ./git/default.nix
    ./desktop/sway.nix
    ./lf/lf.nix
  ];
}
