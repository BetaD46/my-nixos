{ inputs, ... }:

{
  # boot.loader.grub.device = "/dev/nvme0n1p2";
  imports = [
    ../../common/boot-sb.nix
    ../../common/system.nix
    ../../common/packages.nix
    ../../common/nix-settings.nix
    ../../common/desktop.nix
    ../../desktop/kde.nix
    ./hardware-configuration.nix
    # Adds the NUR overlay
    inputs.nur.modules.nixos.default
    # NUR modules can be imported directly:
    inputs.nur.repos.iopq.modules.nixos.xraya
  ];
}
