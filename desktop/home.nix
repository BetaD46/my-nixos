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
}
