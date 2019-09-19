self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.2056";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "0rqyapmcp0w35168dj4bgsgjacl9yqjdnwjg56qx469x2nn5z428";
    };
  })).override { python = python3; };
}
