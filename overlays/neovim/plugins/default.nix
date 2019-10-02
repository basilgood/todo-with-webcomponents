{ vimUtils, fetchFromGitHub, makeWrapper, callPackage }:
with vimUtils; {
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

  html_template = buildVimPlugin {
    pname = "vim-html-template-literals";
    version = "0.2.0";
    src = fetchFromGitHub {
      owner = "jonsmithers";
      repo = "vim-html-template-literals";
      rev = "3499e075ecb780f773375640e2a45ac9dc53ceef";
      sha256 = "01cmxp56r2796inmii3kdj22p0wc8f66ba2p1fhlbhrzz5yaxwh4";
    };

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
