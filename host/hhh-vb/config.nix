{ ... }:

{
  boot.loader.grub.device = "/dev/sda";
  imports = [
    ../nixos/mod.nix
    ../common/desktop.nix
    # ../../desktop/niri.nix
    ../../desktop/kde.nix
    ./hardware-configuration.nix
  ];
}
