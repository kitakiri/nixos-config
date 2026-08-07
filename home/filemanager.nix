{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Основной файловый менеджер и архиватор
    nautilus
    file-roller          # Интеграция архивов в контекстное меню Nautilus
    sushi                # Быстрый предпросмотр файлов по нажатию Пробела

    # Плагины превью (миниатюры для видео и файлов)
    ffmpegthumbnailer

    # Поддержка форматов архивов
    p7zip
    unzip
    rar
  ];

  # Назначаем Nautilus файловым менеджером по умолчанию
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };
}
