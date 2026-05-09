{ ... }:

{
  nix.settings = {
    substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
