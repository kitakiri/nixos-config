{ pkgs, ... }: {
  home.packages = with pkgs; [
    kdePackages.elisa
  ];

  xdg.mimeApps.defaultApplications = {
    "audio/mpeg"          = [ "org.kde.elisa.desktop" ];
    "audio/mp4"           = [ "org.kde.elisa.desktop" ];
    "audio/flac"          = [ "org.kde.elisa.desktop" ];
    "audio/x-flac"        = [ "org.kde.elisa.desktop" ];
    "audio/ogg"           = [ "org.kde.elisa.desktop" ];
    "audio/x-vorbis+ogg"  = [ "org.kde.elisa.desktop" ];
    "audio/opus"          = [ "org.kde.elisa.desktop" ];
    "audio/x-opus+ogg"    = [ "org.kde.elisa.desktop" ];
    "audio/x-wav"         = [ "org.kde.elisa.desktop" ];
    "audio/wav"           = [ "org.kde.elisa.desktop" ];
    "audio/aac"           = [ "org.kde.elisa.desktop" ];
    "audio/x-aac"         = [ "org.kde.elisa.desktop" ];
    "audio/x-ms-wma"      = [ "org.kde.elisa.desktop" ];
  };
}
