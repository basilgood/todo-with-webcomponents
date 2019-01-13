self: super:
{
  wterm = with super; stdenv.mkDerivation rec {
    name = "wterm";

    src = fetchFromGitHub {
      owner = "basilgood";
      repo = "wterm";
      rev = "98ed787b4deb64b5288fabb9d65111396b0c1a9f";
      sha256 = "0xazsd7jvi85mykaj1hplkgc15bv97ysbypb7qi3d80jj1l9cqza";
    };
    nativeBuildInputs = [ ncurses pkgconfig fontconfig ];
    buildInputs = [  pixman libxkbcommon wayland libdrm ];
    installPhase = ''
      mkdir -p $out/share
      TERMINFO=$out/share/terminfo make install PREFIX=$out
    '';
  };
}
