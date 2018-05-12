self: super:
{
  gitkraken_latest = with super; gitkraken.overrideAttrs(old: rec {
    name = "gitkraken-${version}";
    version = "3.6.0";
    src = fetchurl {
      url = "https://release.gitkraken.com/linux/v${version}.deb";
      sha256 = "0zrxw7rrlspm3ic847dy1ly4rlcdkizdr6m8nycmrxg4s98yxkb8";
    };
    buildCommand = ''
        mkdir -p $out
        dpkg -x $src $out
        substituteInPlace $out/usr/share/applications/gitkraken.desktop \
          --replace /usr/share/gitkraken $out/bin
        cp -av $out/usr/* $out
        rm -rf $out/etc $out/usr $out/share/lintian
        chmod -R g-w $out

        for file in $(find $out -type f \( -perm /0111 -o -name \*.so\* \) ); do
          patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" "$file" || true
          patchelf --set-rpath ${old.libPath}:$out/share/gitkraken $file || true
        done

        find $out/share/gitkraken -name "*.node" -exec patchelf --set-rpath "${old.libPath}:$out/share/gitkraken" {} \;

        mkdir $out/bin
        ln -s $out/share/gitkraken/gitkraken $out/bin/gitkraken
      '';
  });
}

