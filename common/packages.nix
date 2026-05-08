{ pkgs, ... }:


{
  programs.yazi.enable = true;
  environment.systemPackages = with pkgs; [
    git
    # rustc
    # cargo
    # nushell
  ];
}
