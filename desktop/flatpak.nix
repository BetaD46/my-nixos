{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  # flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "com.tencent.WeChat"
      "com.qq.QQ"
      "com.qq.QQmusic"
      "com.cherry_ai.CherryStudio"
      "com.github.tchx84.Flatseal"
    ];
  };
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
