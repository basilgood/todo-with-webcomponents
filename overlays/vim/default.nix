self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.2217";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1wdaw2aybmwa1d448hv29p8yq3yssiiyric7kbr03x4vpwc6mycz";
    };
  })).override { python = python3; };
}
