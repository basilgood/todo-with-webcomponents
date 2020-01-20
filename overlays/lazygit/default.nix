self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (old: rec {
    name = "lazygit";
    src = fetchFromGitHub {
      owner = "jesseduffield";
      repo = "lazygit";
      rev = "466e0be560e999184cd24c3ccdb1b68e8fbc9ac6";
      sha256 = "1888crlmhvr6gh5z1m4cz1ybpb1j7q228awjh8bc2s76h0lzjrgh";
    };
  });
}
