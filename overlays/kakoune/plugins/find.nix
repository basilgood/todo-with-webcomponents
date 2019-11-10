{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  name = "kakoune-find";
  version = "2018-06-05";
  src = fetchFromGitHub {
    owner = "occivink";
    repo = name;
    rev = "a306701c43ebddb2c1a618a39584521ff9630a78";
    sha256 = "1w716a0rzl5iksnzpi8xfk6jmwz9s7im03xl83db003v5dczqngb";
  };

  installPhase = ''
    mkdir -p $out/share/kak/autoload/plugins
    cp -r *.kak $out/share/kak/autoload/plugins/find
  '';
}
