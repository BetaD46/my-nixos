{ ... }:

{
  # niri
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # nemo 终端设置
  dconf = {
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "alacritty";
        # exec-arg = ""; # argument
      };
    };
  };

  imports = [
    ../home.nix
  ];
}