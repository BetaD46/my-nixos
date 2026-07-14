# 通用 home.nix
{ ... }:

{
  home.stateVersion = "26.05";

  programs = {
    nushell = {
      enable = true;
      configFile.source = ../configs/nushell/config.nu;
    };

    git = {
      enable = true;
      lfs.enable = true;
      includes = [
        {
          contents = {
            user = {
              name = "wjf";
              email = "1057403878@qq.com";
            };
            http.proxy = "http://localhost:7897";
            https.proxy = "http://localhost:7897";
          };
        }
      ];
      ignores = [
        "**.local**"
      ];
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
  xdg.configFile."./starship.toml".source = ../configs/starship.toml;
}
