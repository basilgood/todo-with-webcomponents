self: super:
{
  dmenu = with super; dmenu.override (old: rec {
    patches = [
      ./dmenu-fuzzymatch-4.6.diff
    ];
  });
}
