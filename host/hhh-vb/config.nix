{ ... }:

{
  boot.loader.grub.device = "/dev/sda";
  imports = [
    ../nixos/mod.nix
    # ../../desktop/niri.nix
    ../../desktop/kde.nix
    ./hardware-configuration.nix
  ];
}
