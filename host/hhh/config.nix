{ inputs, pkgs, ... }:

{
  # cachyos 内核编译时间长，根据主机选择使用
  # nixpkgs.overlays = [
  #   inputs.nix-cachyos-kernel.overlays.default
  # ];
  # boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub.device = "nodev"; # UEFI 系统使用 nodev，传统 bios 系统使用磁盘路径
  boot.loader.grub.configurationLimit = 5;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot";

  # # 节省空间使用 systemd boot
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.systemd-boot.configurationLimit = 5;

  # 蓝牙支持
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../common/system.nix
    ../../common/packages.nix
    ../../desktop/base.nix
    ../../desktop/niri.nix
    # Adds the NUR overlay
    inputs.nur.modules.nixos.default
    # NUR modules can be imported directly:
    inputs.nur.repos.iopq.modules.nixos.xraya
    ../../common/nur.nix
    ../../desktop/flatpak.nix
    # ../../common/nvidia.nix
  ];
}
