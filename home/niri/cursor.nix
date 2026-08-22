{ pkgs, ... }:{
  home.pointerCursor = {
    enable = true;
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };
}
