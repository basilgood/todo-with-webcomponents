self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.2073";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1hdw2mqygm6bq3zll1hx5d82qx297fk6kywkcfmy5xhwlxns1mwm";
    };
  })).override { python = python3; };
}
