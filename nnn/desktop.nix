{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # noctalia-shell
    noctalia-shell
    zed-editor
    nil
    nixd
  ];

  # fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      maple-mono.NF-CN
      # nemo
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };

  programs.firefox.enable = true;
  programs.niri.enable = true;
  # programs.niri.useNautilus = false;
  programs.clash-verge.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.wjf = ./home.nix;
  };

  imports = [
    inputs.home-manager.nixosModules.default
  ];
}
