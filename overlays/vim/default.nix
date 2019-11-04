self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.2238";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1fz6mpir842a67km7w2w76knk5zvr5krrq7iqf1ni029gi2rmidw";
    };
  })).override { python = python3; ftNixSupport = false;};
}
