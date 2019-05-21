{config, lib, options, modulesPath, pkgs}:
{
  programs.bash = import ./bash/default.nix;
  programs.tmux = import ./tmux/tmux.nix {inherit pkgs;};
}
