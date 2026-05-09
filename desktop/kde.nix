{ pkgs, inputs, ... }:

{
  # Enable Plasma
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # plasma-browser-integration
    konsole
    # elisa
  ];

  # PLM
  services.displayManager = {
    plasma-login-manager.enable = true;
    autoLogin.user = "wjf"; # Replace with the desired user
  };

  # Default display manager for Plasma
  # services.displayManager.sddm = {
  # enable = true;

  # To use Wayland (Experimental for SDDM)
  # wayland.enable = true;
  # };

  # Optionally enable xserver
  # services.xserver.enable = true;

  # home-manager 设置
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wjf = ./home.nix;
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
