self: super: {
  # stdenv_native = super.stdenv // { 
  #   mkDerivation = args: super.stdenv.mkDerivation (args // {
  #     NIX_CFLAGS_LINK = toString (args.NIX_CFLAGS_LINK or "") + "-march=native -O2 -pipe";
  #   }); 
  # };
  plumNative = pkg: pkg.overrideAttrs(attrs: {
    NIX_CFLAGS_LINK = toString (attrs.NIX_CFLAGS_LINK or "") + " -O2 -pipe -march=native";
  });

  plumNativeHaswell = pkg: pkg.overrideAttrs(attrs: {
    NIX_CFLAGS_LINK = toString (attrs.NIX_CFLAGS_LINK or "") + " -O2 -pipe -march=haswell";
  });

  plumNativeRyzen = pkg: pkg.overrideAttrs(attrs: {
    NIX_CFLAGS_LINK = toString (attrs.NIX_CFLAGS_LINK or "") + " -O2 -pipe -march=native";
  });
}
