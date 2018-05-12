{pkgs}:

let 
  buildEnv = pkgs.buildEnv;

in {
  allowUnfree = true;
}
