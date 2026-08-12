{ pkgs, ... }: {
  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = ":";
  };
  gtk = {
    enable = true;

    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };
    cursorTheme = {
      name = "macOS";
      package = pkgs.apple-cursor;
      size = 32;
    };
    theme = {
      name = "adw-gtk3"; # Базовая (светлая) тема adw-gtk3
      package = pkgs.adw-gtk3;
    };
  };
  home.packages = with pkgs; [
    morewaita-icon-theme
    adwaita-icon-theme
  ];
  home.pointerCursor = {
    enable = true;
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
}
