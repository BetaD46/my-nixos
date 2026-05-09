{ ... }:

{
  home.stateVersion = "25.11";

  # alacritty
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

  # niri
  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;

  # nemo 终端设置
  dconf = {
    settings = {
        "org/cinnamon/desktop/applications/terminal" = {
            exec = "alacritty";
            # exec-arg = ""; # argument
        };
    };
};
}
