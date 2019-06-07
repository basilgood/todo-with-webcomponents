{ vimUtils, fetchFromGitHub, makeWrapper, callPackage }:
with vimUtils;
{
  quickfix = buildVimPlugin {
    pname= "quickfix-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "stefandtw";
      repo = "quickfix-reflector.vim";
      rev = "c76b7a1f496864315eea3ff2a9d02a53128bad50";
      sha256 = "02vb7qkdprx3ksj4gwnj3j180kkdal8jky69dcjn8ivr0x8g26s8";
    };

    buildPhase = ":";
    configurePhase =":";
  };

  yats = buildVimPlugin {
    pname= "yats-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "HerringtonDarkholme";
      repo = "yats.vim";
      rev = "2126e8306cd21a58fb5e089376af8272abe36bb5";
      sha256 = "1dqaikhcpcqnsnk4a0bwjm2kxsvxsb26357j999sqk1ciq9iy5iy";
    };

    buildPhase = ":";
    configurePhase =":";
  };

  twig = buildVimPlugin {
    pname= "twig-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "lumiliet";
      repo = "vim-twig";
      rev = "ad115512725bcc156f7f89b72ff563b9fa44933b";
      sha256 = "1p7sfhk0mwx4xk88b29ijb9nfbjwsf6hf3nab2ybcw291qaa75nj";
    };

    buildPhase = ":";
    configurePhase =":";
  };

  jsx = buildVimPlugin {
    pname= "jsx-vim";
    version = "2.0.1";
    src = fetchFromGitHub {
      owner = "MaxMEllon";
      repo = "vim-jsx-pretty";
      rev = "007b85e1d51f4dbbba2c15ca4a34b5ff7a8db9ef";
      sha256 = "1pg6sy41ai212jq8p15pz70w4wkn77wd12362j133myd14nsahjf";
    };

    buildPhase = ":";
    configurePhase =":";
  };

  javascript_syntax = buildVimPlugin {
    pname= "vim-javascript-syntax";
    version = "0.8.2";
    src = fetchFromGitHub {
      owner = "jelera";
      repo = "vim-javascript-syntax";
      rev = "139ec9080f219536a94281aef7980654ab7c1a1c";
      sha256 = "18468dljr9fqfy89jfs8ahcfj6a26cp5c4iqi526wwj25irbxf71";
    };

    buildPhase = ":";
    configurePhase =":";
  };

  html_template = buildVimPlugin {
    pname= "vim-html-template-literals";
    version = "0.2.0";
    src = fetchFromGitHub {
      owner = "jonsmithers";
      repo = "vim-html-template-literals";
      rev = "3499e075ecb780f773375640e2a45ac9dc53ceef";
      sha256 = "01cmxp56r2796inmii3kdj22p0wc8f66ba2p1fhlbhrzz5yaxwh4";
    };

    buildPhase = ":";
    configurePhase =":";
  };

  starsearch = buildVimPlugin {
    pname= "starsearch-vim";
    version = "0.1";
    src = fetchFromGitHub {
      owner = "darfink";
      repo = "starsearch.vim";
      rev = "9b8cda1e628160c83846db5a30899a1a1ba5c1c9";
      sha256 = "1i1ygdqwhz4jqmz9lzjnx1a7s5chdqjsvgkmnd9x0s8ixqa41bpr";
    };
  };

  onehalfdark = buildVimPlugin {
    pname= "onehalfdark-vim";
    version = "0.0.1";
    src= ./onehalfdark.vim;

    unpackCmd = ''
      mkdir -p out/colors;
      ln -s $curSrc out/colors/onehalfdark.vim
      ls -al $curSrc
    '';

    buildPhase = ":";
    configurePhase =":";
  };
}
