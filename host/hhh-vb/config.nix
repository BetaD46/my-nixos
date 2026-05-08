{...}:

{
  boot.loader.grub.device = "/dev/sda";
  imports = [
    ../nixos/mod.nix
    ./hardware-configuration.nix
  ];
}
