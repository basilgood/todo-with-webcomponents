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

  vim-picker = pkgs.vimUtils.buildVimPlugin {
    name = "vim-picker";
    src = fetchFromGitHub {
      owner = "srstevenson";
      repo = "vim-picker";
      rev = "0bd022884a5d125cbbb1cd80606f2d23f1cb1ffd";
      sha256 = "167qh2aj2r7x7iixa8kdspmqrngd74naxghhzj7q82cxylybzz9x";
    };
  };

  vim-lsp = pkgs.vimUtils.buildVimPlugin {
    name = "vim-lsp";
    src = fetchFromGitHub {
      owner = "prabirshrestha";
      repo = "vim-lsp";
      rev = "afaba6a1f29aa06c6aafb4d5a4893ff825bc9eb3";
      sha256 = "1nw47jr273qzck43lzr8ksibgsgl4m6i0lpsv0m72mgwz03fmmx6";
    };
  };

  async.vim = pkgs.vimUtils.buildVimPlugin {
    name = "async.vim";
    src = fetchFromGitHub {
      owner = "prabirshrestha";
      repo = "async.vim";
      rev = "627a8c4092df24260d3dc2104bc1d944c78f91ca";
      sha256 = "1hqrfk3wi82gq4qw71xcy1zyplwb8w7bnm6kybpn27hgpipygrvv";
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

  vim-edgemotion = pkgs.vimUtils.buildVimPlugin {
    name = "vim-edgemotion";
    src = fetchFromGitHub {
      owner = "haya14busa";
      repo = "vim-edgemotion";
      rev = "8d16bd92f6203dfe44157d43be7880f34fd5c060";
      sha256 = "1w3nqkw7k2ryrw1rckj27a0jbjnvgc6fb7871fhb4ba2mpxd8l08";
    };
  };

  cool = pkgs.vimUtils.buildVimPlugin {
    name = "vim-cool";
    src = fetchFromGitHub {
      owner = "romainl";
      repo = "vim-cool";
      rev = "06918c36b3396af0bec1e87e748a5dba55be87b9";
      sha256 = "099sbjdk944bnivqgqgbjplczfm3k84583ryrmpqf3lgrq6pl8wr";
    };
  };

  ags = pkgs.vimUtils.buildVimPlugin {
    name = "vim-ags";
    src = fetchFromGitHub {
      owner = "gabesoft";
      repo = "vim-ags";
      rev = "22578799d437f674760d02cd25cfdb9bea0d93fb";
      sha256 = "0v9dhnccr691hva6567r60fnkf2lv8ivz39h4h1qriz8jwg62xc9";
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
