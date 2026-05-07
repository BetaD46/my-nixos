{
  description = "A very basic flake";

  inputs = {
    # 这个 Flake 依赖了 nixpkgs
    # .url 指定来源
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  # self 是 Flake 对外提供的功能（一个属性集），指向自身引用
  # inputs@ 语法将整个 inputs 参数集绑定到 inputs 变量
  outputs = inputs@{ self, nixpkgs }: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # 将 inputs 设置为内联，可在 modules 中引入 inputs
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
        ./my.nix
      ];
    };

    nixosConfigurations.nixos-niri = nixpkgs.lib.nixosSystem {
      # 将 inputs 设置为内联，可在 modules 中引入 inputs
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix
        ./my.nix
        ./nnn/desktop.nix
      ];
    };

  };
}
