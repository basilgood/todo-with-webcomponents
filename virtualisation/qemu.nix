{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.virtualisation.qemu;

in
{
  options = {
    virtualisation.qemu = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
    };
  };
  config = mkIf (cfg.enable) {
    environment.systemPackages = with pkgs; [ qemu_kvm ];
    boot = {
      kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
      kernelParams = [
        "intel_iommu=on"
        "iommu=pt"
        "vfio_iommu_type1.allow_unsafe_interrupts=1"
      ];
    };
    services.udev.extraRules = ''
      SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
    '';
    security.pam.loginLimits = builtins.map (
      type: {
        inherit type;
        domain = "@kvm";
        item = "memlock";
        value = 20000000;
      }
    ) [ "soft" "hard" ];
  };
}
