self: super:
let
  js = import ./js {
    pkgs = super;
    nodejs = super.nodejs-10_x;
  };
in {
  js = js // {
    import-js = js.import-js.override {
      buildInputs = [ super.nodePackages.node-pre-gyp ];
    };
  };
}
