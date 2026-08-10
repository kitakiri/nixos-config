{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Основной файловый менеджер
    nautilus
    # архиватор
    kdePackages.ark
    # Плагины превью (миниатюры для видео и файлов)
    ffmpegthumbnailer

    # Поддержка форматов архивов
    p7zip
    rar
    unzip
    zip
    zstd
  ];

  # Назначаем Nautilus файловым менеджером по умолчанию
  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };
}
