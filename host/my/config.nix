{ inputs, pkgs, ... }:

{
  # cachyos 内核编译时间长，根据主机选择使用
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.default
  ];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;
  # boot.loader.grub.device = "/dev/nvme0n1p2";

  # 节省空间使用 systemd boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.efi.canTouchEfiVariables = true;

  imports = [
    ../../common/system.nix
    ../../common/packages.nix
    ../../desktop/base.nix
    # ../../desktop/kde.nix
    ../../desktop/niri.nix
    # ../../desktop/cinnamon.nix
    # ../../desktop/regreet.nix
    ./hardware-configuration.nix
    # Adds the NUR overlay
    inputs.nur.modules.nixos.default
    # NUR modules can be imported directly:
    inputs.nur.repos.iopq.modules.nixos.xraya
    ../../common/nur.nix
    ../../desktop/flatpak.nix
    ../../common/nvidia.nix
  ];
}
