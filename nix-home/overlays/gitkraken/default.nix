self: super: 
{
  gitkraken = super.gitkraken.overrideAttrs (old: rec { 
    version = "4.0.5";
    src = super.fetchurl {
      url = "https://release.axocdn.com/linux/GitKraken-v${version}.deb";
      sha256 = "15wxcahlnz2k3331wqv30d5gq38fqh178hv87xky9b9vyh8qpcvz";
      };
    }); 
}
