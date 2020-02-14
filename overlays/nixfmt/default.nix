self: super:
{
  nixpkgs-fmt = fetchTarball {
    url = https://github.com/nix-community/nixpkgs-fmt/archive/2cf49e323e4d51c571cfad1601f305f4f902a2c2.tar.gz;
    sha256 = "1ry3620mzcif3xxd9cdmbq4nhcngaw0cqfc3g9dc7r2qa6qg59ps";
  };
}
