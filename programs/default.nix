{config, lib, options, modulesPath, pkgs}:
{
  programs.bash = import ./bash/default.nix;
}
