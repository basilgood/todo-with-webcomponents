self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (old: rec {
    name = "lazygit-${version}";
    version = "0.6";
    src = fetchFromGitHub {
      owner = "jesseduffield";
      repo = "lazygit";
      rev = "v${version}";
      sha256 = "1a6kj4agcbyji0dbn72ph9zfq074vd3dsxyx43x1qjkil35r62i5";
    };
  });
}
