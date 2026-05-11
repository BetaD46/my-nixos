{ pkgs, inputs, ... }:

{
  # Enable Plasma
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
    kate
    sddm
  ];

  # PLM
  services.displayManager = {
    plasma-login-manager.enable = true;
    # autoLogin.user = "wjf"; # Replace with the desired user
  };

  # programs.regreet = {
  #   enable = true;
  #   settings = {
  #     GTK.application_prefer_dark_theme = true;
  #   };
  #   # For this example you'd need to have a version of Adwaita and the font Cantarell installed
  #   theme.name = "Adwaita";
  #   font = {
  #     name = "Cantarell";
  #     size = 16;
  #   };
  #   cursorTheme.name = "Adwaita";
  # };

  # Default display manager for Plasma
  # services.displayManager.sddm = {
  #   enable = true;

  #   # To use Wayland (Experimental for SDDM)
  #   wayland.enable = true;
  # };

  # Optionally enable xserver
  services.xserver.enable = true;

  home-manager.users.wjf = {
    imports = [
      ./home.nix
    ];
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
