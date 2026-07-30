{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice-qt
    nil
    nixd
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    dbeaver-bin
    fastfetch
    lx-music-desktop
    # inputs.nixpkgs-stable.legacyPackages.x86_64-linux.clash-verge-rev
    chromium
    libnotify # 桌面通知工具
  ];

  # programs.firefox.enable = true;
  # programs.clash-verge = {
  #   enable = true;
  #   autoStart = true;
  #   tunMode = true; # 疑似无效
  # };
  # appimage 运行支持
  # programs.appimage.enable = true;
  # programs.appimage.binfmt = true;
  services.mihomo.enable = true;
  services.mihomo.tunMode = true;
  # services.mihomo.webui = pkgs.metacubexd; # 构建静态页面
  services.mihomo.configFile = "/home/wjf/.config/mihomo/config.yaml";

  # 输入法
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      # See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
      waylandFrontend = true;
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
      maple-mono.NF-CN-unhinted
      # nemo
    ];

    fontconfig = {
      hinting.enable = false;
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "Maple Mono NF CN" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
