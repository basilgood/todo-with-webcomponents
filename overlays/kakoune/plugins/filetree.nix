{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  name = "kakoune-filetree";
  version = "2019-7-19";
  src = fetchFromGitHub {
    owner = "occivink";
    repo = name;
    rev = "79f9b9098e0104bf57b3ebb0f1b0a0c15b8e72fc";
    sha256 = "161jvqrvkm9ysxp55vlxnxvdlqwxkivkpdapz6bpw4pgv0z4fbkn";
  };

  installPhase = ''
    mkdir -p $out/share/kak/autoload/
    cp -r *.kak $out/share/kak/autoload/filetree
  '';
}
