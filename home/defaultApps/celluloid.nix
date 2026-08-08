{ pkgs, ... }: {
  home.packages = with pkgs; [
    celluloid mpv
  ];
  xdg.mimeApps.defaultApplications = {
    "video/mp4"           = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/x-matroska"    = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/webm"          = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/quicktime"     = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/mpeg"          = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/x-msvideo"     = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/x-flv"         = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/x-ms-wmv"      = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/3gpp"          = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "video/ogg"           = [ "io.github.celluloid_player.Celluloid.desktop" ];
    "application/ogg"     = [ "io.github.celluloid_player.Celluloid.desktop" ];
  };
}
