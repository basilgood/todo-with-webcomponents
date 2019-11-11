self: super:
with super; {
  gitAndTools = gitAndTools // {
    tig = super.symlinkJoin {

      name = "tig-with-config";

      paths = [
        (gitAndTools.tig.overrideAttrs (old: rec {
          pname = "tig";
          version = "2.4.2";
          name = "${pname}-${version}";

          src = fetchFromGitHub {
            owner = "jonas";
            repo = pname;
            rev = "2f38ea6239c996454e923c13d250a9bb43908779";
            sha256 = "03c2vpwj268nnaziqpkcllj52rfvy1dm00b47cg2bykby5j7syp7";
          };
        }))
      ];

      nativeBuildInputs = [ super.makeWrapper ];

      postBuild = ''
        wrapProgram $out/bin/tig --set TIGRC_USER ${./tigrc}
      '';
    };
  };
}
