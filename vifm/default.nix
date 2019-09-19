{ config, lib, pkgs, ... }:
with pkgs;
let
  vifmColor = writeText "color" (callPackage ./colors/onedark.vifm {});
in {
  environment.etc."vifm/vifmrc".text = ''
    ${builtins.readFile ./vifmrc}
  '';
  environment.systemPackages = [vifm];
}
