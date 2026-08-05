{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Основной файловый менеджер и архиватор
    kdePackages.dolphin
    kdePackages.ark

    # Плагины превью (миниатюры для видео, фото, PDF и т.д.)
    kdePackages.kdegraphics-thumbnailers # Фото, RAW, PDF
    kdePackages.ffmpegthumbs             # Видео миниатюры
    kdePackages.kio-extras               # Расширенная поддержка протоколов и превью

    # Поддержка работы архиваторов с разными форматами
    p7zip
    unzip
    rar
  ];

  # Назначаем Dolphin файловым менеджером по умолчанию
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
    };
  };
}
