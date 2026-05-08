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

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${config.programs.niri.package}/bin/niri-session";
  #       user = "wjf";
  #     };
  #   };
  # };

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  # systemd.user.services.niri.enableDefaultPath = false;
}
