{ ... }:

{
  boot.loader.grub.device = "/dev/sda";
  imports = [
    ../nixos/mod.nix
    ../../nnn/desktop.nix
    ./hardware-configuration.nix
  ];
}
