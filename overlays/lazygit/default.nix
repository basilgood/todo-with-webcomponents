self: super:
with super;
{
  lazygit = lazygit.overrideAttrs (old: rec {
    name = "lazygit";
    src = fetchFromGitHub {
      owner = "jesseduffield";
      repo = "lazygit";
      rev = "963c034b481e6676656e981cbc8e2f923cc1ac41";
      sha256 = "1xh564h7hb8bi8w1sn65vb6hkr0f88vaz7qsdg2aay5l72709j9p";
    };
  });
}
