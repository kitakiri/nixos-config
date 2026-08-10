{...}: {
  # Включаем поддержку Flatpak
  services.flatpak.enable = true;

  # Включаем поддержку AppImage и регистрацию формата в binfmt_misc,
  # чтобы файлы .AppImage запускались напрямую как обычные бинарники
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
