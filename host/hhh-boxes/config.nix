{ pkgs, ... }:

{
    boot.loader.efi.efiSysMountPoint = "/dev/vda";
    # boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_0;
    boot.kernelPatches = [
        {
            name = "Rust Support";
            patch = null;
            features = {
                rust = true;
            };
        }
    ];
    imports = [
        ../nixos/mod.nix
    ];
}