self: super:
{
  bemenu = with super; stdenv.mkDerivation rec {
    name = "bemenu";
    buildInputs = [cmake pkgconfig libconfig ncurses5 wayland libxkbcommon doxygen cairo pango pcre xorg.libpthreadstubs xorg.libXdmcp];
    src = fetchFromGitHub {
      owner = "Cloudef";
      repo = "bemenu";
      rev = "5ecb57085785c8e3fac68d8a2f2b6cf2e44c1092";
      sha256 = "014d6j5sv67a6k4hkgkjp6fnd3gmgsshkjngaq8viz0cdkashrdx";
    };
  };
}
