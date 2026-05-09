{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    noctalia-shell
    nemo
  ];

  programs.niri.enable = true;
  programs.niri.useNautilus = false;

  # 设置默认文件管理器
  xdg = {
    mime.defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-gnome-saved-search" = [ "nemo.desktop" ];
    };
  };

  # home-manager 设置
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wjf = ./niri/home.nix;
  };

  imports = [
    ../common/desktop.nix
    inputs.home-manager.nixosModules.default
  ];
}
