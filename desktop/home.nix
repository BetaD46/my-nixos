# 桌面通用 home.nix
{ ... }:

{
  # alacritty
  programs = {
    alacritty = {
      enable = true;
      # theme = "solarized_dark";
      settings = {
        window = {
          # decorations = "None"; # 应由 niri 单独设置
          padding.x = 16;
        };
      };
    };
  };
}
