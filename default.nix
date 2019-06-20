{ config, options, lib, pkgs, ... }: {
  imports = [
    ./local.nix
    ./general.nix
    ./bash/default.nix
    ./git/default.nix
    ./desktop/sway.nix
    ./lf/lf.nix
  ];
}
