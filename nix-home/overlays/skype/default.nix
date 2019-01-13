self: super:
{
  skypeforlinux = with super; skypeforlinux.overrideAttrs (old: rec {
    version = "8.34.0.78";

    src = fetchurl {
      url = "https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_${version}_amd64.deb";
      sha256 = "1986nvdw1cpj06rq76hjsif0j4z5g2k01v73r4c4n43q7dgzl5z0";
    };
  });
}
