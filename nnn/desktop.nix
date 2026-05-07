{ config, pkgs, lib, ... }:

{
  # boot.loader.grub.device = "/dev/vda";
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev";
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.useOSProber = true;
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    # noctalia-shell
    pkgs.noctalia-shell
    pkgs.zed-editor
    alacritty
  ];

  # fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      pkgs.maple-mono.NF-CN
    ];

    fontconfig = {
      defaultFonts = {
        serif = [  "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };

  programs.firefox.enable = true;
  programs.niri.enable = true;
}
