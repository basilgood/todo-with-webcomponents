self: super:
with super;
{
  tmux = tmux.overrideAttrs (attrs: rec {
  pname = "tmux";
  version = "92ecd611f68663dfceb2494e637b3ebe51d3fd86";

  outputs = [ "out" "man" ];
  src = fetchFromGitHub {
    owner = "tmux";
    repo = "tmux";
    rev = version;
    sha256 = "0mbajk03qbix1z6fcllb5hlrw8baidsn34mvp903xggx81xv5yrl";
  };
  });
}
