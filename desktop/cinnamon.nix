{ pkgs, inputs, ... }:

{
  environment.cinnamon.excludePackages = [
    pkgs.blueman
  ];
  services.xserver.desktopManager.cinnamon.enable = true;
  home-manager.users.wjf = {
    imports = [
      ./home.nix
    ];
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
