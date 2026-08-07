{ pkgs, config, ... }:

let
  iniFormat = pkgs.formats.ini { };

  # Единый генератор INI-конфига для qt5ct и qt6ct
  qtCtConfig = iniFormat.generate "qtct.conf" {
    Appearance = {
      color_scheme_path = "${config.home.homeDirectory}/.config/qt5ct/colors/noctalia.conf";
      custom_palette = true;
      icon_theme = "MoreWaita";
      standard_dialogs = "xdgdesktopportal";
      style = "Fusion";
    };
  };
in
{
  # 1. Нативная настройка Qt через Home Manager
  qt = {
    enable = true;
    platformTheme.name = "qtct"; # Автоматически ставит qt5ct + qt6ct и выставляет QT_QPA_PLATFORMTHEME
    style.name = "fusion";
  };

  # 2. Переиспользование единого атрибут-сета для Qt5 и Qt6
  xdg.configFile."qt5ct/qt5ct.conf".source = qtCtConfig;
  xdg.configFile."qt6ct/qt6ct.conf".source = qtCtConfig;
}
