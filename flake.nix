{
  description = "A very basic flake";

  inputs = {
    # 这个 Flake 依赖了 nixpkgs
    # .url 指定来源
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  # self 是 Flake 对外提供的功能（一个属性集），指向自身引用
  # inputs@ 语法将整个 inputs 参数集绑定到 inputs 变量
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nur,
      nix-cachyos-kernel,
    }:
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        # 将 inputs 设置为内联，可在 modules 中引入 inputs
        specialArgs = { inherit inputs; };
        modules = [
          ./host/nixos/mod.nix
        ];
      };

      nixosConfigurations.nixos-niri = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./host/nixos/mod.nix
          ./nnn/desktop/nix
        ];
      };

      nixosConfigurations.hhh-vb = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./host/hhh-vb/config.nix
        ];
      };

      nixosConfigurations.my = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./host/my/config.nix
        ];
      };
    };
}
