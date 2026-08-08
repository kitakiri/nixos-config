{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    # discord
    obsidian
    fastfetch
    krita
    bazaar
    meld

    # GNOME Apps легкие в целом
    loupe
    papers
    lollypop
    mpv celluloid

    # KDE Apps
    #kdePackages.discover
    #kdePackages.gwenview                # Просмотр изображений
    #kdePackages.okular                  # Просмотр PDF и документов
    #kdePackages.elisa                   # Музыкальный плеер


  ];
}
