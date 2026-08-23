{ ... }: {
  # Включаем GVFS для корректной работы файловых менеджеров (например, Nautilus)
  services.gvfs.enable = true;
}
