{ ... }:

{
  hardware.graphics.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.nvidiaPersistenced = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true; # 使用开源驱动

  # wayland 需要启动内核模式设置（KMS）
  hardware.nvidia.modesetting.enable = true;
}
