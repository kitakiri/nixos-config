{ config, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    # Стандартные директории XDG
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    publicShare = "${config.home.homeDirectory}/Public";
    templates = "${config.home.homeDirectory}/Templates";
    videos = "${config.home.homeDirectory}/Videos";

    # Кастомные директории, которые будут записаны "как есть" (например, XDG_PROJECTS_DIR)
    extraConfig = {
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
      # Сюда же можно добавлять любые другие:
      # XDG_GAMES_DIR = "${config.home.homeDirectory}/Games";
    };
  };
}
