{
  config,
  pkgs,
  ...
}: {
  # Vklyuchenie graficheskogo podosnovaniya (OpenGL / Vulkan)
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Obyazatel'no dlya Steam i 32-bitnyh prilozheniy
  };

  # Ukazyvaem X-serveru ispol'zovat' NVIDIA drayver
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting vsegda dolzhen byt' true dlya raboty Wayland
    modesetting.enable = true;

    # Upravlenie pitaniem (false dlya is klyucheniya problem s provuzhdeniem)
    powerManagement.enable = true;
    # эффективный переход в спящий режим
    powerManagement.finegrained = true;

    # Proprietary drayver (false) chasto stabil'nee dlya serii RTX 40xx, chem open-source
    open = true;

    # GUI panel' nastroek Nvidia Nvidia Settings
    nvidiaSettings = true;

    # Avtomaticheskiy vybor stabil'noy versii drayvera pod vashe yadro
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # Parametry yadra dlya ispravnoy inicializacii bufera kadra v Wayland
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

  # Peremennye okruzheniya dlya forsirovaniya Wayland rezhima
  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Ispravlyaet vozmozhnoe merzanie i belye ekrany v Qt6 / KDE
    NIXOS_OZONE_WL = "1";
  };
}
