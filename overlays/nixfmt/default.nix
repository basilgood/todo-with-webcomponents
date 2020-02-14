self: super:
{
  nixpkgs-fmt = (import (fetchTarball https://github.com/nix-community/nixpkgs-fmt/archive/master.tar.gz) {});
}
