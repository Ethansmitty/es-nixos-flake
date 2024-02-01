{ pkgs, config, ... }:

{
  # Bootloader
 boot.loader = {
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  grub.enable = true;
  grub.device = "nodev";
  grub.default = "saved";
 };
  # This is for OBS Virtual Cam Support - v4l2loopback setup
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
}
