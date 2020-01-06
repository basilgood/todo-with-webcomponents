self: super:
with super; {
  gitAndTools = gitAndTools // {
    tig = super.symlinkJoin {

      name = "tig-with-config";

      paths = [
        (gitAndTools.tig.overrideAttrs (old: rec {
          pname = "tig";
          version = "2.5.0";
          name = "${pname}-${version}";

          src = fetchFromGitHub {
            owner = "jonas";
            repo = pname;
            rev = "ca0809dbd20a31f6fa9b84c7eed5ecaa1368cd9d";
            sha256 = "095c1gipw62nd4d6cgln2vdgyacf1zgmrr7h78sanmbnqqr2iwx8";
          };
          patches = [];

        }))
      ];

      nativeBuildInputs = [ super.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/tig --set TIGRC_USER ${./tigrc}
      '';
    };
  };
}
