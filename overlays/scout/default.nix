self: super:
with super;
{
  scout = rustPlatform.buildRustPackage rec {
    pname = "scout";
    version = "v1.3.0";

    src = fetchFromGitHub {
      owner = "jhbabon";
      repo = pname;
      rev = version;
      sha256 = "0av7x0imqaiwffpqzyvz6xp2xgvgpj6ira3iwqi6z86xr3n1dsmb";
    };
    cargoSha256 = "0ykxj3nqlvvxl681gidh10rd4hdg8n4ildgywgwf280paa6rgf61";
    verifyCargoDeps = true;

    meta = with stdenv.lib; {
      description = "Small fuzzy finder made in rust";
      homepage = https://github.com/jhbabon/scout.git;
      license = licenses.unlicense;
      maintainers = [];
      platforms = platforms.all;
    };
  };
}
