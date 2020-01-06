self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (old: rec {
    name = "lazygit";
    src = fetchFromGitHub {
      owner = "jesseduffield";
      repo = "lazygit";
      rev = "96ca7262e4b66e4de7cb8b4859cc2b3117bcffe8";
      sha256 = "1qb0mgbl8nxkwk6zxylm25d9j4pzp0a6zi140b106igid5c7h5m2";
    };
  });
}
