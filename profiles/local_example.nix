{ config, lib, pkgs, ... }:
{
  networking.hostName = "__hostname__";
  time.timeZone = "Europe/Bucharest";


  users = {
    groups.__user__ = {
      gid = 1000;
    };
    users.__user__ = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = ["__user__" "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal" "lxd" "docker"];
      initialPassword = "__user__";
    };
  };
 }
