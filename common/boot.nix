{ pkgs, ... }:

{
    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.configurationLimit = 3;
    # boot.loader.grub.device = "/dev/sda";
    # boot.loader.grub.useOSProber = true;
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.systemd-boot.configurationLimit = 3;
    # boot.loader.efi.canTouchEfiVariables = true;

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
}
