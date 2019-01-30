self: super:
{
  st = with super; st.override (old: rec {
    patches = [
      ./st-scrollback-mouse-0.8.diff
      ./st-scrollback-0.8.diff
      ./st-xresources-20180309-c5ba9c0.diff
      ./st-vertcenter-20180320-6ac8c8a.diff
    ];
  });
}
