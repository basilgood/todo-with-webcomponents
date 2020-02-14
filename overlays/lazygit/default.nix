self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (
    old: rec {
      name = "lazygit";
      src = fetchFromGitHub {
        owner = "jesseduffield";
        repo = "lazygit";
        rev = "71e018a3dd01af4cb12c18b2e73ed34d6ce3b010";
        sha256 = "163d05081yrbnzvpkjd7knsl50pkqg9g22ncc2hi54i1i0h5pp80";
      };
    }
  );
}
