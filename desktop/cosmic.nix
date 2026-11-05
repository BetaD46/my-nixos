{ inputs, pkgs, ... }:

{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment.systemPackages = with pkgs; [
    seahorse
  ];

  # 启用 gnome-keyring
  services.gnome.gnome-keyring.enable = true;

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
