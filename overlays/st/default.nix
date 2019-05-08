self: super:
{
  st = with super; (st.override { 
    conf = builtins.readFile ./config.def.h;
    # config = builtins.readFile ./x.c;
  
  });
    # patches = [
    #   ./st-scrollback-mouse-0.8.diff
    #   ./st-scrollback-20190122-3be4cf1.diff
    #   ./st-vertcenter-20180320-6ac8c8a.diff
    #   ./st-anysize-0.8.1.diff
    #   ./st-onedark.diff
    #   ./font.diff
    # ];
}
