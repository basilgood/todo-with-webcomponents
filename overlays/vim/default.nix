self: super:
with super;
let
  vimrc = callPackage ./vimrc.nix { };
  options = callPackage ./options.nix { };
  mappings = callPackage ./mappings.nix { };
  # customPlugins = import ./plugins.nix { inherit self super; };
  # allPlugins = vimPlugins // customPlugins;
in {
  vim = ((vim_configurable.overrideAttrs (attrs: rec {
    name = "vim-${version}";
    version = "8.2.0008";

    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "09vxwjsywcgg426sshxbxwzm08v8qniqzask3zgyc37fwwmgsnqh";
    };
  })).override {
    python = python3;
    ftNixSupport = false;
  }).customize {
    name = "vim";
    vimrcConfig = {
      packages.myVimPackage = with vimPlugins; {
        start = [ vim-nix  ];
      };
      customRC = ''
          ${vimrc}
          ${options}
          ${mappings}
        '';
      };
    };
    }
