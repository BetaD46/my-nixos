{
  description = "A very basic flake";

  inputs = {
    # 这个 Flake 依赖了 nixpkgs
    # .url 指定来源
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-26.05";
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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # self 是 Flake 对外提供的功能（一个属性集），指向自身引用
  # inputs@ 语法将整个 inputs 参数集绑定到 inputs 变量
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nur,
      nix-cachyos-kernel,
      nix-flatpak,
      zen-browser,
    }:
    {
      nixosConfigurations.hhh = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./host/hhh/config.nix
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
