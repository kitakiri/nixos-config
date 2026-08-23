{ config, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Dynamic Power Management: полностью гасит 3050 в простое
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Для мобильных GPU Ampere (30-я серия) проприетарный драйвер надежнее в управлении питанием
    open = false;

    nvidiaSettings = false; # На Wayland/Niri GUI-панель не нужна
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # Добавляет команду nvidia-offload в систему
      };

      # Уточни значения на ноуте через `lspci | grep -E "VGA|3D"`
      # (например, "00:02.0" -> "PCI:0:2:0", "01:00.0" -> "PCI:1:0:0")
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
