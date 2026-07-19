{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    # Список всех необходимых пакетов шрифтов
    packages = with pkgs; [
      inter                         # Лучший современный Sans Serif
      pt-serif                      # Лучший Serif с идеальной кириллицей в пару к Inter
      liberation_ttf                # Метрические клоны Times/Arial для документов
      nerd-fonts.jetbrains-mono     # Идеальный Monospace со всеми иконками для терминала
      noto-fonts-emoji              # Поддержка отображения эмодзи
    ];

    # Тонкая настройка рендеринга и дефолтных ассоциаций
    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";           # Баланс четкости букв без искажения их формы
      };
      subpixel = {
        rgba = "rgb";               # Стандарт для большинства ЖК-мониторов
        lcdfilter = "default";
      };

      # Принудительно назначаем главные шрифты для всей системы
      defaultFonts = {
        sansSerif = [ "Inter" ];
        serif     = [ "PT Serif" "Liberation Serif" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji     = [ "Noto Color Emoji" ];
      };
    };
  };
}
