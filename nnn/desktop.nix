{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # noctalia-shell
    pkgs.noctalia-shell
    pkgs.zed-editor
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

  programs.regreet = {
    enable = true;
      settings = {
        GTK.application_prefer_dark_theme = true;
      };
      # For this example you'd need to have a version of Adwaita and the font Cantarell installed
      theme.name = "Adwaita";
      font = {
        name = "Cantarell";
        size = 16;
      };
      cursorTheme.name = "Adwaita";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wjf = ./home.nix;
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
