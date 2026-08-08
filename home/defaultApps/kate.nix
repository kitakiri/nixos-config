{ pkgs, ... }: {
  home.packages = with pkgs; [
    kdePackages.kate
  ];

  # Ассоциации файлов по умолчанию
  xdg.mimeApps = {
    defaultApplications = {
      "text/plain"    = [ "org.kde.kate.desktop" ];
      "text/markdown" = [ "org.kde.kate.desktop" ];
    };
  };
}
