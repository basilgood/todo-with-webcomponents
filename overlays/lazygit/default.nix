self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (
    old: rec {
      name = "lazygit";
      src = fetchFromGitHub {
        owner = "jesseduffield";
        repo = "lazygit";
        rev = "d9eb6e26823bd001d4e50c1343f810cd31bab566";
        sha256 = "12sb6v5rpw4gadk2h2ld788hk7sn0kxpq7r4rzg7bzdh8570l4wv";
      };
    }
  );
}
