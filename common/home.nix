{ ... }:

{
  home.stateVersion = "25.11";

  programs = {
    nushell = {
      enable = true;
      configFile.source = ./nushell/config.nu;
    };
  };
}
