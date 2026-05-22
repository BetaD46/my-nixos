# 通用 home.nix
{ ... }:

{
  home.stateVersion = "26.05";

  programs = {
    nushell = {
      enable = true;
      configFile.source = ./nushell/config.nu;
    };
  };
}
