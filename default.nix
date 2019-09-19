{ config, options, lib, pkgs, ... }: {
  imports = [
    ./local.nix
    ./general.nix
    ./bash/default.nix
    ./git/default.nix
    ./desktop/sway.nix
    ./desktop/waybar.nix
    ./lf/lf.nix
    ./vifm
  ];
}
