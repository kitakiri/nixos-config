{ config, lib, pkgs, ... }:

{
  options.modules.sound.music.enable = lib.mkEnableOption "music, MIDI and DAW tools (guitar, routing, etc.)";

  config = lib.mkIf config.modules.sound.music.enable {
    # низкая задержка для игры на гитаре
    services.pipewire.extraConfig.pipewire = {
      "10-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 128;     # ~2.6 ms задержки (при желании можно поставить 64)
          "default.clock.min-quantum" = 64;
          "default.clock.max-quantum" = 1024;
        };
      };
    };

    # Добавляем пользователя в группу audio
    users.users.kitakiri.extraGroups = [ "audio" ];

    # Софт для гитары и маршрутизации
    environment.systemPackages = with pkgs; [
      # Маршрутизаторы и хосты
      carla                  # Удобный хост для VST/LV2 с визуальным патчбеем

      # Гитарные плагины и эмуляторы
      guitarix               # Классический гитарный процессор
      neural-amp-modeler-lv2 # NAM — отличные нейропрофили усилителей и кабинетов
      tonelib-gfx
      aida-x
      gxplugins-lv2          # Набор дисторшнов и педалей от команды Guitarix
      lsp-plugins            # Набор кастомных эффектов, ревербов и эквалайзеров
    ];
  };
}
