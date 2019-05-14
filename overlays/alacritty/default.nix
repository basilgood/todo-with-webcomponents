self: super:
{
  alacritty = super.symlinkJoin {
    name = "alacritty-with-config-${super.alacritty.version}";

    paths = [ super.alacritty ];
    nativeBuildInputs = [ super.makeWrapper ];

    postBuild = ''
      wrapProgram $out/bin/alacritty \
        --add-flags "--config-file ${./config}" \
    '';

    passthru.terminfo = super.alacritty.terminfo;
  };

}
