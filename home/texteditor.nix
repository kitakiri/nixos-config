{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome-text-editor # Простой и быстрый GTK4 текстовый редактор
  ];

  # Ассоциации файлов по умолчанию
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "text/markdown" = [ "org.gnome.TextEditor.desktop" ];
    };
  };
}
