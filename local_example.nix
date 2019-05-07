{ config, lib, pkgs, ... }:
{
  networking.hostName = "_host_";
  time.timeZone = "__/__";

  users = {
    groups._user_ = {
      gid = 1000;
    };
    users._user_ = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = ["_user_" "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" "lxd" "docker" "vboxusers" "sway"];
      initialPassword = "_user_";
    };
  };
  system.stateVersion = "19.09"; # Did you read the comment?
}
