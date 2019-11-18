self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.2317";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1fppx75ax2s0bgr88yw2csk0iwmgfg2zaisb8wkrd27hsnjgxgrr";
    };
  })).override { python = python3; ftNixSupport = false;};
}
