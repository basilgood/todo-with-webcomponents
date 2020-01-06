{ self, super }:
with super;

{

  vim-fugitive = pkgs.vimUtils.buildVimPlugin {
    name = "vim-fugitive";
    src = fetchFromGitHub {
      owner = "tpope";
      repo = "vim-fugitive";
      rev = "3bf602b13d86b7aef57fec4a2df29467b61435cb";
      sha256 = "07d3jd96mil4v487m5ic214mccaw19hmzcl5ywkdiqszgvpxhrq7";
    };
  };

  asyncdo = pkgs.vimUtils.buildVimPlugin {
    name = "asyncdo";
    src = fetchFromGitHub {
      owner = "hauleth";
      repo = "asyncdo.vim";
      rev = "0be2a28189a6df9b48a1bf0a5d4d6c1ddc81eb0c";
      sha256 = "1ni8qxpall8f70lpqr3nlaqw136a6lfis8f6mz45jnmgf1ljh1qb";
    };
  };

  vim-fzy = pkgs.vimUtils.buildVimPlugin {
    name = "vim-fzy";
    src = fetchFromGitHub {
      owner = "bfrg";
      repo = "vim-fzy";
      rev = "e687f39e45dd9bdbbb213a05126ac52568d28078";
      sha256 = "0ww54i02ink9bpgnb9nwc9wy3m2q2pyzwjnlbwq0h6q2lg6vyapl";
    };
  };

  vim-altscreen = pkgs.vimUtils.buildVimPlugin {
    name = "vim-altscreen";
    src = fetchFromGitHub {
      owner = "fcpg";
      repo = "vim-altscreen";
      rev = "127fc8ec2b450fe41ee207c06b126ebedcbbbf3e";
      sha256 = "16wfy3g9rxzm790xsr8c8ami8mm0wc7pl96lyn1f5i4kkjvxazil";
    };
  };

  vim-lsc = pkgs.vimUtils.buildVimPlugin {
    name = "vim-lsc";
    src = fetchFromGitHub {
      owner = "natebosch";
      repo = "vim-lsc";
      rev = "6cb8410e10f1b6a23adf238c1f93ce19a3eef83a";
      sha256 = "1zqv58s35qvp53an15mvs7ywvarsqxc0has6yji99jwmjiq68pag";
    };
  };

  yats = pkgs.vimUtils.buildVimPlugin {
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

  twig = pkgs.vimUtils.buildVimPlugin {
    name = "twig-vim";
    src = fetchFromGitHub {
      owner = "lumiliet";
      repo = "vim-twig";
      rev = "ad115512725bcc156f7f89b72ff563b9fa44933b";
      sha256 = "1p7sfhk0mwx4xk88b29ijb9nfbjwsf6hf3nab2ybcw291qaa75nj";
    };
  };

  vim-js = pkgs.vimUtils.buildVimPlugin {
    name = "vim-js";
    src = fetchFromGitHub {
      owner = "yuezk";
      repo = "vim-js";
      rev = "48624983bf747624921075679d65533fa75a6174";
      sha256 = "1vczqq1gflyy2g2ycsyrpvz6zsscnmhi08k3imh86snk9ivs4ipb";
    };
  };

  jsx = pkgs.vimUtils.buildVimPlugin {
    name = "vim-jsx-pretty";
    src = fetchFromGitHub {
      owner = "MaxMEllon";
      repo = "vim-jsx-pretty";
      rev = "89c30c0defe8ddb31bc0d3cfa5f22f3f6d8eb24f";
      sha256 = "1l5cwlbmihzxldpxlvn5gc47s0awqs908skzq43cy44iql829hir";
    };
  };

  multiple-cursors = pkgs.vimUtils.buildVimPlugin {
    name = "vim-multiple-cursors";
    src = fetchFromGitHub {
      owner = "terryma";
      repo = "vim-multiple-cursors";
      rev = "6ab4dc7dd012e23adee74ef4596ad3e9659a20c7";
      sha256 = "149cg1fwsrd1swvd0ivn1p8j8gpj3gk08mx6dim4fkshknwxs5l0";
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

  conflict-marker = pkgs.vimUtils.buildVimPlugin {
    name = "conflict-marker.vim";
    src = fetchFromGitHub {
      owner = "da-x";
      repo = "conflict-marker.vim";
      rev = "9b7c67715d13a18ba0abd2d81b393dc8d458a3fb";
      sha256 = "03sfhb182bwz0gy3ksn4i6850cncc9l3b0cmfpfl6a642fl7xi3v";
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

  min = pkgs.vimUtils.buildVimPlugin {
    pname = "min";
    version = "0.0.1";
    src = ./colors/min.vim;
    unpackCmd = ''
      mkdir -p out/colors;
      ln -s $curSrc out/colors/min.vim
    '';
    buildPhase = ":";
    configurePhase = ":";
  };

  retro = pkgs.vimUtils.buildVimPlugin {
    pname = "retro";
    version = "0.0.1";
    src = ./colors/retro.vim;
    unpackCmd = ''
      mkdir -p out/colors;
      ln -s $curSrc out/colors/retro.vim
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
    '';
    buildPhase = ":";
    configurePhase = ":";
  };

}
