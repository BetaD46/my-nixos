{ ... }:

{
  # boot.loader.grub.device = "/dev/nvme0n1p2";
  imports = [
    ../../common/boot-sb.nix
    ../../common/system.nix
    ../../common/packages.nix
    ../../common/nix-settings.nix
    ../../nnn/desktop.nix
    ../../nnn/dm.nix
    ./hardware-configuration.nix
  ];
}
