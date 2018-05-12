self: super:
{
  vim_plum = with super; vim_configurable.merge rec {
    name  = "vim_configurable-${version}";
    version = "8.0.1527";
    src = fetchFromGitHub {
      owner = "vim";
      repo = "vim";
      rev = "v${version}";
      sha256 = "1qxs96kwyli45azic3gh3dls4jpla2az40ys5hyi6pcnn79ydn8w";
    };
  };
}
