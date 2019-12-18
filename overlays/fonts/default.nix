self: super: {
  nerdfont_dejavu = super.stdenv.mkDerivation rec {
    name = "nerdfont-dejavu";

    src = super.fetchurl {
      url =
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DejaVuSansMono.zip";
        sha256 = "06xk9qgw78xrbsq0kx9xxqff1fg4mxkyypi113mzvdjbx5khyfha";
    };

    unpackCmd = ''
      ${super.unzip}/bin/unzip $curSrc -d fonts
    '';
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      cp * $out/share/fonts/opentype
    '';
  };
}
