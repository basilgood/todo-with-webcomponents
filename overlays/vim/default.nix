self: super:
with super; {
  vimHugeX = vimHugeX.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.1.1931";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "01j18660m09nvnrkq2991bsvh43xxns51zv05frdnfqg3fdlmjdj";
    };
  });
  vim_configurable = vim_configurable.override { python = python3; };
}
