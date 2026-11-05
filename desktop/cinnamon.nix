{ pkgs, inputs, ... }:

{
  environment.cinnamon.excludePackages = [
    pkgs.blueman
  ];
  services.xserver.desktopManager.cinnamon.enable = true;

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
