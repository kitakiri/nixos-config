{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Основной файловый менеджер
    nautilus
    # архиватор
    kdePackages.ark
    kdePackages.breeze-icons
    # Плагины превью (миниатюры для видео и файлов)
    ffmpegthumbnailer

    # Поддержка форматов архивов
    p7zip
    unzip
    rar
  ];

  # Назначаем Nautilus файловым менеджером по умолчанию
  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };
}
