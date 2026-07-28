# emulation.nix
{ pkgs, ... }: {
  # =========================================================================
  # 1. RetroArch + Ядра для классических / легких консолей
  # =========================================================================
  programs.retroarch = {
    enable = true;

    # Ядра подключаются через сгенерированный набор атрибутов (pkgs.libretro.<name>)
    cores = {
      # Game Boy / Game Boy Color / Game Boy Advance
      mgba.enable = true;

      # Super Nintendo (SNES)
      snes9x.enable = true;

      # Nintendo Entertainment System (NES / Famicom)
      mesen.enable = true;

      # Sega Genesis / Mega Drive / Master System / Game Gear
      genesis-plus-gx.enable = true;

      # PlayStation 1 (Если захочется запускать PS1 прямо из RetroArch)
      swanstation.enable = true;
      beetle-psx-hw.enable = true;
    };

    # Глобальные настройки, автоматически заносимые в retroarch.cfg
    settings = {
      # Драйвер графики и интерфейса
      video_driver = "vulkan";
      menu_driver = "ozone"; # Современный интерфейс, удобный для мыши и геймпада

      # Автоматическое определение подключенных геймпадов
      input_autodetect_enable = "true";

      # Функции геймплея
      rewind_enable = "true";           # Возможность отматывать время назад
      savestate_auto_save = "true";      # Автосохранение при выходе
      savestate_auto_load = "true";      # Автозагрузка при запуске

      # Системные уведомления в игре (OSD)
      video_font_enable = "true";
    };
  };

  # =========================================================================
  # 2. Standalone эмуляторы (PS1-PS3) и Единый фронтенд
  # =========================================================================
  home.packages = with pkgs; [
    # PS1 (Standalone — максимальная гибкость настройки PGXP, шейдеров и GUI)
    duckstation

    # PS2 (Standalone — полностью обновленный Qt/Vulkan интерфейс)
    pcsx2

    # PS3 (Standalone — единственный эмулятор с полной поддержкой архитектуры Cell)
    rpcs3

    # Фронтенд для геймпада (Заменяет запуск каждого эмулятора вручную)
    emulationstation-de
  ];
}
