self: super:
let
  url = https://github.com/timjrd/popcorntime.nix/archive/master.tar.gz;
  popcornTime = ((import (builtins.fetchTarball url)) { });
in { popcornTime = popcornTime; }
