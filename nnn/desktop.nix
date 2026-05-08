{ config, pkgs, lib, ... }:

{
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
