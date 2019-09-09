{ config, options, lib, pkgs, ... }: {
  imports = [
    ./local.nix
    ./general.nix
    ./bash/default.nix
    ./git/default.nix
    ./desktop/sway.nix
    # ./waybar/default.nix
    ./lf/lf.nix
    ./vifm
  ];
}
