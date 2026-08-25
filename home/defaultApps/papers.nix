{ pkgs, ... }: {
  home.packages = with pkgs; [
    papers
  ];

  xdg.mimeApps.defaultApplications = {
    "application/pdf"                  = [ "org.gnome.Papers.desktop" ];
    "application/x-pdf"                = [ "org.gnome.Papers.desktop" ];
    "application/postscript"           = [ "org.gnome.Papers.desktop" ];
    "application/x-dvi"                = [ "org.gnome.Papers.desktop" ];
    "application/x-gzdvi"              = [ "org.gnome.Papers.desktop" ];
    "image/vnd.djvu"                   = [ "org.gnome.Papers.desktop" ];
    "image/vnd.djvu+multipage"         = [ "org.gnome.Papers.desktop" ];
    "application/vnd.ms-xpsdocument"   = [ "org.gnome.Papers.desktop" ];
    "application/oxps"                 = [ "org.gnome.Papers.desktop" ];
    "application/epub+zip"             = [ "org.gnome.Papers.desktop" ];
    "application/x-cbz"                = [ "org.gnome.Papers.desktop" ];
    "application/x-cbr"                = [ "org.gnome.Papers.desktop" ];
    "application/x-cb7"                = [ "org.gnome.Papers.desktop" ];
    "application/x-cbt"                = [ "org.gnome.Papers.desktop" ];
    "application/vnd.comicbook+zip"    = [ "org.gnome.Papers.desktop" ];
    "application/vnd.comicbook-rar"    = [ "org.gnome.Papers.desktop" ];
  };
}
