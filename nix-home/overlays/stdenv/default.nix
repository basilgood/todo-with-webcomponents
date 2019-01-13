self: super: {
  packNative = pkg: pkg.overrideAttrs(attrs: {
    NIX_CFLAGS_COMPILE = toString (attrs.NIX_CFLAGS_COMPILE or "") + " -O2 -pipe -march=native";
  });
}
