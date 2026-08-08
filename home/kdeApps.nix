{ pkgs, ... }: {
  home.packages = with pkgs; [
    # --- Основной набор приложений ---
    kdePackages.gwenview                # Просмотр изображений
    kdePackages.okular                  # Просмотр PDF и документов
    kdePackages.elisa                   # Музыкальный плеер
    kdePackages.dragon                  # Видосы
    #kdePackages.ark                     # Архиватор
    kdePackages.kate                    # Текстовый редактор

    # --- Расширения для полноценной работы Dolphin ---
    #kdePackages.kio-extras              # Поддержка SFTP, SMB (Samba), MTP (смартфоны) и просмотр архивов
    #kdePackages.dolphin-plugins         # Интеграция Git/Subversion в контекстное меню
    #kdePackages.ffmpegthumbs            # Эскизы/превью для видеофайлов
    #kdePackages.kdegraphics-thumbnailers# Превью для PDF и графических файлов
    kdePackages.breeze-icons            # Системные иконки KDE (исключает "пустые" кнопки)

    # --- Бэкенды архивации для работы Ark прямо из Dolphin ---
    p7zip
    rar
    unzip
    zip
    zstd
  ];
}
