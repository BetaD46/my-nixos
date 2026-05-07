{ config, pkgs, lib, ... }:


{
  services.openssh.enable = true;
  nix.settings = {
    substituters = lib.mkForce [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  boot.loader.systemd-boot.configurationLimit = 3;

  programs.yazi.enable = true;
  environment.systemPackages = with pkgs; [
    git
    # rustc
    # cargo
    # nushell
  ];
}
