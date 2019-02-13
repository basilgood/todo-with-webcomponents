self: super:
with super;
{
  git-cola = git-cola.overrideAttrs (old: rec {
    name = "git-cola${version}";
    version = "3.3";
    src = fetchFromGitHub {
      owner = "git-cola";
      repo = "git-cola";
      rev = "v${version}";
      sha256 = "0gfbzcmaqg6hdy2cfpshgcwh8zgj1ia1vd95i5xdrsvksgb8fq2j";
    };
  });
}
