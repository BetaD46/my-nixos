# niri 专用 home.nix
{ ... }:

{
  # niri 配置文件
  xdg.configFile."niri/config.kdl" = {
    source = ./config.kdl;
    force = true;
  };
  # dms 配置
  xdg.configFile."niri/extra.kdl".text = ''
    include "./dms/wpblur.kdl"
    include "./dms/binds.kdl"
    include "./dms/colors.kdl"
    include "./dms/cursor.kdl"
    include "./dms/windowrules.kdl"
    include "./dms/alttab.kdl"
    include "./dms/outputs.kdl"
  '';

  # nemo 终端设置
  dconf = {
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "alacritty";
        # exec-arg = ""; # argument
      };
    };
  };

  # waybar 与其配置文件
  # programs.waybar = {
  #   enable = true;
  # };
  # xdg.configFile."waybar/config.jsonc".source = ../waybar/config.jsonc;
  # xdg.configFile."waybar/style.css".source = ../waybar/style.css;
}
