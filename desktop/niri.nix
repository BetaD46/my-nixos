{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # noctalia-shell
    # nemo
    kdePackages.dolphin
    xwayland-satellite
    papirus-icon-theme
  ];

  # programs.xwayland.enable = true;
  # programs.labwc.enable = true;

  programs.niri.enable = true;
  programs.niri.useNautilus = false;

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };

  # dms
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    # enableCalendarEvents = true; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting from the clipboard history (wtype)
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
  };

  # 设置默认文件管理器
  xdg = {
    mime.defaultApplications = {
      "inode/directory" = [ "dolphin.desktop" ];
      "application/x-gnome-saved-search" = [ "dolphin.desktop" ];
    };
  };

  # home-manager 设置
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wjf = {
      imports = [
        ../common/home.nix
        ./niri/home.nix
        ./home.nix
      ];
    };
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
