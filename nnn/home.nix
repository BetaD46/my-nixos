{ ... }:

{
  home.stateVersion = "25.11";
  programs = {
    alacritty = {
      enable = true;
      # theme = "solarized_dark";
      settings = {
        window = {
          decorations = "None";
          padding.x = 16;
        };
      };
    };
  };
  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
}
