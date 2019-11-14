self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (old: rec {
    name = "lazygit";
    src = fetchFromGitHub {
      owner = "jesseduffield";
      repo = "lazygit";
      rev = "30aed94aa8451911fc1c5ba1e52ff28b180a8d31";
      sha256 = "0qj59p0dgkwz1l80b7glj342ikary7hvch0ki4j9rnr48sxbc0gz";
    };
  });
}
