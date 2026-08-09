{ pkgs, ... }: {
  # Включаем GVFS для корректной работы файловых менеджеров (например, Nautilus)
  services.gvfs.enable = true;

  # KIO для работы Dolphin
  services.dbus.packages = with pkgs.kdePackages; [
    kio
    kio-extras
    kio-fuse
  ];
}
