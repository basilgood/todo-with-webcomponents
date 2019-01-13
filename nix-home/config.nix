{pkgs}:
{
  allowUnfree = true;
  # packageOverrides = pkgs: {
  #   chromium = pkgs.chromium.override {
  #     commandLineArgs = "--enable-native-gpu-memory-buffers --enable-gpu-rasterization --ignore-gpu-blacklist --enable-zero-copy --force-gpu-rasterization";
  #   };
  # };
}
