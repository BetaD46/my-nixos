{ lib, ... }:

{
  nix.settings = {
    substituters = lib.mkForce [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
