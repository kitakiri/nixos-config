{ pkgs, ... }: {
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = ":";
    gtk4.extraConfig.gtk-decoration-layout = ":";
    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
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
