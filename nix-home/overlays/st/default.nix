self: super:
{
  st = with super; st.override (old: rec {
    patches = [
      ./st-scrollback-mouse-0.8.diff
      ./st-scrollback-20190122-3be4cf1.diff
      ./st-xresources-20190105-3be4cf1.diff
      ./st-vertcenter-20180320-6ac8c8a.diff
    ];
  });
}
