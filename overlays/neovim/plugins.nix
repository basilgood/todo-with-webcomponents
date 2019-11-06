{ self, super }:
with super;

{

  vim-fugitive = pkgs.vimUtils.buildVimPlugin {
    name = "vim-fugitive";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-fugitive";
      rev = "f6acae50ea4d8ec1bb1497cb886d80298b54831b";
      sha256 = "04k9bmqzlrx9pvkjs51znbbrqxy416k6jl7ffdp892hacgvr8cnj";
    };
  };

  targets = pkgs.vimUtils.buildVimPlugin {
    name = "targets.vim";
    src = fetchFromGitHub {
      owner = "wellle";
      repo = "targets.vim";
      rev = "a79447f261e4b8b4327557aa03726f3849334b84";
      sha256 = "0x6a9rmv220kncjgak6aw3gbf3sidnj6nijphnsm5360lvi3ck4w";
    };
  };

  wildfire = pkgs.vimUtils.buildVimPlugin {
    name = "wildfire.vim";
    src = fetchFromGitHub {
      owner = "gcmt";
      repo = "wildfire.vim";
      rev = "e2baded7162260e05d2527f5bca9fca81f0bc8f2";
      sha256 = "01i12x8brsnqicj5vclg57nv6ha7nz70gilphf6sr14xr741ra1y";
    };
  };

  conflict3 = pkgs.vimUtils.buildVimPlugin {
    name = "conflict3";
    src = fetchFromGitHub {
      owner = "mkotha";
      repo = "conflict3";
      rev = "180e387fa464f27346db6a9c577ae6c1a26cd39a";
      sha256 = "027p8qd897q5p80cq95wwb3gln9jjjnzibsj8cd6bdsizy0cxcq7";
    };
  };

  vcs-jump = pkgs.vimUtils.buildVimPlugin {
    name = "vcs-jump";
    src = fetchFromGitHub {
      owner = "wincent";
      repo = "vcs-jump";
      rev = "a83cd2a6bfbf9356ee439a0e6aa29f8eaea4bb38";
      sha256 = "1n6g49pkf0qb2p5d845qgyndw3xh2ijzz8vm7lblsi9kb452bn7w";
    };
  };

  vim-edgemotion = pkgs.vimUtils.buildVimPlugin {
    name = "vim-edgemotion";
    src = fetchFromGitHub {
      owner = "haya14busa";
      repo = "vim-edgemotion";
      rev = "8d16bd92f6203dfe44157d43be7880f34fd5c060";
      sha256 = "1w3nqkw7k2ryrw1rckj27a0jbjnvgc6fb7871fhb4ba2mpxd8l08";
    };
  };

  vim-editorconfig = pkgs.vimUtils.buildVimPlugin {
    name = "vim-editorconfig";
    src = fetchFromGitHub {
      owner = "sgur";
      repo = "vim-editorconfig";
      rev = "6b50f575752605f7e0a0e99e88be4129b2f99311";
      sha256 = "1kp82k3aympfhmdnfg45ynf3d5chs75ni740z5j05x6pgcj88rwz";
    };
  };

  vim-parenmatch = pkgs.vimUtils.buildVimPlugin {
    name = "vim-parenmatch";
    src = fetchFromGitHub {
      owner = "itchyny";
      repo = "vim-parenmatch";
      rev = "1a00e366a24f37ceaf8df87b5ff8bbd9f90e3758";
      sha256 = "00vkkq473qxzc6k1gmkbd91nqs81h0yszixpby3djwblg16fch75";
    };
  };

  vim-submode = pkgs.vimUtils.buildVimPlugin {
    name = "vim-submode";
    src = fetchFromGitHub {
      owner = "kana";
      repo = "vim-submode";
      rev = "d29de4f55c40a7a03af1d8134453a703d6affbd2";
      sha256 = "1qf0ryyjbv3yw916dnvqlzqvpskg2sbkwn46a2zph71p16sg6cp7";
    };
  };

  cmdline = pkgs.vimUtils.buildVimPlugin {
    name = "cmdline-completion";
    src = fetchFromGitHub {
      owner = "sgur";
      repo = "cmdline-completion";
      rev = "34d03039b838fddc36a8ac75e4760d8e2835a5fb";
      sha256 = "0rjassl3l41ncdg2jyzawksinbp3pyf2g3vp8wvh0cxbmhabqjzg";
    };
  };

  jsonc = pkgs.vimUtils.buildVimPlugin {
    name = "jsonc.vim";
    src = fetchFromGitHub {
      owner = "neoclide";
      repo = "jsonc.vim";
      rev = "80da2a52db41b4c1ecf6f511422d3771e05622fa";
      sha256 = "1yix6dq1fh5nhwh5c1gr6z9d05ir5a2d0advdsli7n1y0cmwa8hr";
    };
  };

  theonlyone = pkgs.vimUtils.buildVimPlugin {
    pname = "theonlyone";
    version = "0.0.1";
    src = ./colors/theonlyone.vim;
    unpackCmd = ''
      mkdir -p out/colors;
      ln -s $curSrc out/colors/theonlyone.vim
      ls -al $curSrc
    '';
    buildPhase = ":";
    configurePhase = ":";
  };

  allfunc = pkgs.vimUtils.buildVimPlugin {
    pname = "allfunc";
    version = "0.0.1";
    src = ./allfunc/functions.vim;
    unpackCmd = ''
      mkdir -p out/autoload;
      ln -s $curSrc out/autoload/functions.vim
      ls -al $curSrc
    '';
    buildPhase = ":";
    configurePhase = ":";
  };


}
