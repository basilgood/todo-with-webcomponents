{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./merlin.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  # boot.blacklistedKernelModules = [ "nouveau" ];
  # boot.kernelParams = [ "nomodeset" "video=vesa:off" "vga=normal" ];
  # boot.vesa = false;
  # hardware.opengl.enable = true;
  # hardware.opengl.driSupport32Bit = true;
  # services.xserver.videoDrivers = [ "nvidia" "vesa" ];
  hardware.pulseaudio.enable = true;
  networking.hostName = "merlin"; # Define your hostname.
  networking.networkmanager.enable = true;

  system.stateVersion = "18.03"; # Did you read the comment?

}

