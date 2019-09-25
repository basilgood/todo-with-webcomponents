self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.2065";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1bgcfyy4yya1j4fzjngkqviyw4xzckkh0kn31rdy23nwx92nsjwh";
    };
  })).override { python = python3; };
}
