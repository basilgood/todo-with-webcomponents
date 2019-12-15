self: super:
with super; {
  vimHugeX = (vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.2.0008";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "09vxwjsywcgg426sshxbxwzm08v8qniqzask3zgyc37fwwmgsnqh";
    };
  })).override { python = python3; ftNixSupport = false;};
}
