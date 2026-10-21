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
          padding.y = 16;
          dimensions = {
            columns = 108;
            lines = 64;
          };
        };
        keyboard.bindings = [
          {
            key = "`";
            mods = "Control";
            action = "CreateNewWindow";
          }
        ];
        mouse.bindings = [
          {
            mouse = "Right";
            action = "Copy";
          }
        ];
        terminal = {
          shell = {
            program = "/etc/profiles/per-user/wjf/bin/nu";
          };
        };
      };
    };

    zed-editor.enable = true;

    obsidian.enable = true;
  };
}
