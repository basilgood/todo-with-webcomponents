self: super:

{
  emacs = self.emacs27;

  emacs27 = with self; stdenv.lib.overrideDerivation
    (self.emacs26.override { srcRepo = true; }) (attrs: rec {
      name = "emacs-${version}${versionModifier}";
      version = "27.0";
      versionModifier = ".50";
      src = fetchGit {
        url = "git://git.sv.gnu.org/emacs.git";
        rev = "80376945952943888bb34c7d4ea06972e422eca7";
      };
      buildInputs = super.emacs.buildInputs ++ [ super.jansson super.harfbuzz ];
      patches = [
      ];
      postInstall = super.emacs.postInstall + ''
        for srcdir in src lisp lwlib ; do
          dstdir=$out/share/emacs/${version}/$srcdir
          mkdir -p $dstdir
          find $srcdir -name "*.[chm]" -exec cp {} $dstdir \;
          cp $srcdir/TAGS $dstdir
          echo '((nil . ((tags-file-name . "TAGS"))))' > $dstdir/.dir-locals.el
        done
      '';
    });
}


