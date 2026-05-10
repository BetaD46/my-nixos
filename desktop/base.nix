{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zed-editor
    libreoffice-qt
    nil
    nixd
  ];

  programs.firefox.enable = true;
  programs.clash-verge = {
    enable = true;
    tunMode = true; # 疑似无效
  };
  # appimage 运行支持
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # 输入法
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      # See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
      waylandFrontend = false;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
      ];
    };
  };

  # fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      maple-mono.NF-CN
      # nemo
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };
}
