{
  config,
  lib,
  pkgs,
  ...
}: {

  programs.niri = {
    enable = true;

    settings = {
      hotkey-overlay.skip-at-startup = true;
      #
      # Мониторы
      #
      outputs = {
      };

      #
      # Ввод
      #
      input = {
        keyboard = {
          xkb = {
            layout = "us,ru";
            options = "grp:caps_toggle";
          };
        };
      };

      #
      # Рабочие пространства
      #
      workspaces = {
      };

      #
      # Горячие клавиши
      #
      binds = with config.lib.niri.actions; {
          #
          # Терминал
          #
        "Super+Return".action = spawn "foot";
          #
          # Закрыть окно
          #
          "Super+Q".action = close-window;

          #
          # Полноэкранный режим
          #
          "Super+F".action = fullscreen-window;

          #
          # Скрыть (отправить в overview)
          #
          "Super+H".action = minimize-window;

          #
          # Перемещение фокуса
          #
          "Super+Left".action  = focus-column-left;
          "Super+Right".action = focus-column-right;
          "Super+Up".action    = focus-window-up;
          "Super+Down".action  = focus-window-down;

          #
          # Перемещение окон
          #
          "Super+Shift+Left".action  = move-column-left;
          "Super+Shift+Right".action = move-column-right;

          #
          # Перезагрузить конфиг
          #
          "Super+Shift+R".action = reload-config;

          #
          # Выход из niri
          #
          # "Super+Shift+E".action = quit;
      };

      #
      # Правила окон
      #
      window-rules = [
      ];

      #
      # Автозапуск
      #
      spawn-at-startup = [
        { command = [ "xwayland-satellite" ]; }
        { command = [ "noctalia-shell" ]; }
      ];
    };
  };

  home.packages = with pkgs; [
    foot
    xwayland-satellite
    wl-clipboard
    # brightnessctl
    playerctl
    grim
    slurp
  ];
}
