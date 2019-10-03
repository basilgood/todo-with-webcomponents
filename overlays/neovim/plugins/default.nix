{ vimUtils, fetchFromGitHub, makeWrapper, callPackage }:
with vimUtils;

{
  ale = buildVimPluginFrom2Nix {
    pname = "ale";
    version = "2019-09-25";
    src = fetchFromGitHub {
      owner = "dense-analysis";
      repo = "ale";
      rev = "41ff80dc9ec2cc834cc8c4aaa753e308223d48b8";
      sha256 = "1bfylcp9490cd2yz00nq6ky1w55dkvldrdjxip36ahci4cpfn0xw";
    };
  };

  tcomment = buildVimPlugin {
    pname = "tcomment";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "tomtom";
      repo = "tcomment_vim";
      rev = "c9cecefc639b6019e0f12b7e9fb5a2375cd550c1";
      sha256 = "0xb61wchvj1iqzwxzscv3zwbsx1qjh8qhkmijsrjz92566g12xhy";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  jsonc = buildVimPlugin {
    pname = "jsonc.vim";
    version = "2019-06-25";
    src = fetchFromGitHub {
      owner = "neoclide";
      repo = "jsonc.vim";
      rev = "80da2a52db41b4c1ecf6f511422d3771e05622fa";
      sha256 = "1yix6dq1fh5nhwh5c1gr6z9d05ir5a2d0advdsli7n1y0cmwa8hr";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  mergetool = buildVimPlugin {
    pname = "mergetool-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "samoshkin";
      repo = "vim-mergetool";
      rev = "0275a85256ad173e3cde586d54f66566c01b607f";
      sha256 = "1i3zil06zyndm400i2pfn64ykbs29fw8l720229a8ypp9mxcibcp";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  yats = buildVimPlugin {
    pname = "yats-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "HerringtonDarkholme";
      repo = "yats.vim";
      rev = "d9af5fc9fd7f11fa1219a9acb6f4243105e60b38";
      sha256 = "0dqd9s0s8xvr9yh33ycncfd0y1nlsfh64azb8f92bggx5plkji2r";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  twig = buildVimPlugin {
    pname = "twig-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "lumiliet";
      repo = "vim-twig";
      rev = "ad115512725bcc156f7f89b72ff563b9fa44933b";
      sha256 = "1p7sfhk0mwx4xk88b29ijb9nfbjwsf6hf3nab2ybcw291qaa75nj";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  jsx = buildVimPlugin {
    pname = "jsx-vim";
    version = "2.0.1";
    src = fetchFromGitHub {
      owner = "MaxMEllon";
      repo = "vim-jsx-pretty";
      rev = "007b85e1d51f4dbbba2c15ca4a34b5ff7a8db9ef";
      sha256 = "1pg6sy41ai212jq8p15pz70w4wkn77wd12362j133myd14nsahjf";
    };

    buildPhase = ":";
    configurePhase = ":";
  };

  javascript_syntax = buildVimPlugin {
    pname = "vim-javascript-syntax";
    version = "0.8.2";
    src = fetchFromGitHub {
      owner = "jelera";
      repo = "vim-javascript-syntax";
      rev = "139ec9080f219536a94281aef7980654ab7c1a1c";
      sha256 = "18468dljr9fqfy89jfs8ahcfj6a26cp5c4iqi526wwj25irbxf71";
    };

    buildPhase = ":";
    configurePhase = ":";
  };

  agit = buildVimPlugin {
    pname = "agit.vim";
    version = "2019-04-2";
    src = fetchFromGitHub {
      owner = "cohama";
      repo = "agit.vim";
      rev = "a953f125e1aea1fc2e5aa06f23378ba180b18e4a";
      sha256 = "1381sglnx3spjqjw7nqf8037z815n9dcnva3dhbazhslyq31hrd3";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  vim-editorconfig = buildVimPlugin {
    pname = "vim-editorconfig";
    version = "0.8.0";
    src = fetchFromGitHub {
      owner = "sgur";
      repo = "vim-editorconfig";
      rev = "6b50f575752605f7e0a0e99e88be4129b2f99311";
      sha256 = "1kp82k3aympfhmdnfg45ynf3d5chs75ni740z5j05x6pgcj88rwz";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  fzf-vim = buildVimPlugin {
    pname = "fzf-vim";
    version = "2019-07-4";
    src = fetchFromGitHub {
      owner = "junegunn";
      repo = "fzf.vim";
      rev = "359a80e3a34aacbd5257713b6a88aa085337166f";
      sha256 = "0a01g0gw59m57zizidvm9n89qh8lvj0aq4kyxy27i72ysclp3wsf";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  wildfire = buildVimPlugin {
    pname = "wildfire.vim";
    version = "2014-10-16";
    src = fetchFromGitHub {
      owner = "gcmt";
      repo = "wildfire.vim";
      rev = "e2baded7162260e05d2527f5bca9fca81f0bc8f2";
      sha256 = "01i12x8brsnqicj5vclg57nv6ha7nz70gilphf6sr14xr741ra1y";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  cmdline = buildVimPlugin {
    pname = "cmdline-completion";
    version = "2014-04-10";
    src = fetchFromGitHub {
      owner = "sgur";
      repo = "cmdline-completion";
      rev = "34d03039b838fddc36a8ac75e4760d8e2835a5fb";
      sha256 = "0rjassl3l41ncdg2jyzawksinbp3pyf2g3vp8wvh0cxbmhabqjzg";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  vim-edgemotion = buildVimPlugin {
    pname = "vim-edgemotion";
    version = "2017-12-26";
    src = fetchFromGitHub {
      owner = "haya14busa";
      repo = "vim-edgemotion";
      rev = "8d16bd92f6203dfe44157d43be7880f34fd5c060";
      sha256 = "1w3nqkw7k2ryrw1rckj27a0jbjnvgc6fb7871fhb4ba2mpxd8l08";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  ags = buildVimPlugin {
    pname = "vim-ags";
    version = "2019-5-22";
    src = fetchFromGitHub {
      owner = "gabesoft";
      repo = "vim-ags";
      rev = "7daf3e22a97eccd95e7ba4414a2a04888bf57c7b";
      sha256 = "1sfzgyjl7419j3skb76wyvv892lxh2zajq8qi6b98blbv31vwnd0";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  targets = buildVimPlugin {
    pname = "targets.vim";
    version = "2019-5-22";
    src = fetchFromGitHub {
      owner = "wellle";
      repo = "targets.vim";
      rev = "a79447f261e4b8b4327557aa03726f3849334b84";
      sha256 = "0x6a9rmv220kncjgak6aw3gbf3sidnj6nijphnsm5360lvi3ck4w";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  vim-auto-cursorline = buildVimPlugin {
    pname = "vim-auto-cursorline";
    version = "2019-5-15";
    src = fetchFromGitHub {
      owner = "delphinus";
      repo = "vim-auto-cursorline";
      rev = "dbbe42c3a367f43c2091c481206c802e8c7d2f80";
      sha256 = "1bq1zszx1k2y3wsl46acpbi1iii35l9c2yg0vsrdj1qq4i6a14p1";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  vim-startify = buildVimPlugin {
    pname = "vim-startify";
    version = "2019-10-1";
    src = fetchFromGitHub {
      owner = "mhinz";
      repo = "vim-startify";
      rev = "af03e075a3c0dfe5ca17fd49c59a3f4c30a4b342";
      sha256 = "1dd2vhszck76mpxz2m9qlmyvsravx9xslh4j68y8ygap97y2ykzi";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  vim-javascript = buildVimPlugin {
    pname = "vim-javascript";
    version = "2109-08-15";
    src = fetchFromGitHub {
      owner = "pangloss";
      repo = "vim-javascript";
      rev = "b6c8c8419240bdd29b5eb51a47d488fd390deed5";
      sha256 = "0p56av0zmig4rpsq4w4armnccyd713xdm5lwrck3cip55c39382f";
    };
    buildPhase = ":";
    configurePhase = ":";
  };

  autoload = buildVimPlugin {
    pname = "autoload";
    version = "0.0.1";
    src = ./functions.vim;
    unpackCmd = ''
      mkdir -p out/autoload;
      ln -s $curSrc out/autoload/functions.vim
      ls -al $curSrc
    '';
    buildPhase = ":";
    configurePhase = ":";
  };

  simple = buildVimPlugin {
    pname = "simple-vim";
    version = "0.0.1";
    src = ./simple.vim;
    unpackCmd = ''
      mkdir -p out/colors;
      ln -s $curSrc out/colors/simple.vim
      ls -al $curSrc
    '';
    buildPhase = ":";
    configurePhase = ":";
  };
}
