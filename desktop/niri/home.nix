# niri 专用 home.nix
{ pkgs, ... }:

{
  # niri 配置文件
  xdg.configFile."niri/config.kdl" = {
    source = ./config.kdl;
    force = true;
  };

  # niri 按键绑定
  xdg.configFile."niri/mybinds.kdl" = {
    source = ./mybinds.kdl;
    force = true;
  };

  # niri 输出配置
  xdg.configFile."niri/myoutputs.kdl" = {
    source = ./myoutputs.kdl;
    force = true;
  };

  xdg.configFile."niri/noctalia.kdl" = {
    text = ''
      include "my.kdl"
      include "mybinds.kdl"
      include "myoutputs.kdl"
    '';
    force = true;
  };

  # dms 配置
  # xdg.configFile."niri/dms.kdl".text = ''
  #   include "./dms/wpblur.kdl"
  #   include "./dms/binds.kdl"
  #   include "./dms/colors.kdl"
  #   include "./dms/cursor.kdl"
  #   include "./dms/windowrules.kdl"
  #   include "./dms/alttab.kdl"
  #   include "./dms/outputs.kdl"
  #   include "./dms/layout.kdl"
  # '';

  # nemo 终端设置
  dconf = {
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "alacritty";
        # exec-arg = ""; # argument
      };
    };
  };

  # alacritty niri + dms 专用配置
  programs.alacritty.settings = {
    window.decorations = "None";
    general.import = [ "./dank-theme.toml" ];
  };

  programs.noctalia = {
    enable = true;

    settings = {
      # This may also be a string or path to a .toml file.
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
      };
    };
  };

  # 光标主题
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  # waybar 与其配置文件
  # programs.waybar = {
  #   enable = true;
  # };
  # xdg.configFile."waybar/config.jsonc".source = ../waybar/config.jsonc;
  # xdg.configFile."waybar/style.css".source = ../waybar/style.css;
}
