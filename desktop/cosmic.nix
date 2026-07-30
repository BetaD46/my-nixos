{ inputs, pkgs, ... }:

{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment.systemPackages = with pkgs; [
    seahorse
  ];

  # 启用 gnome-keyring
  services.gnome.gnome-keyring.enable = true;

  # home-manager 设置
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wjf = {
      imports = [
        ../common/home.nix
        ./home.nix
      ];
    };
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
