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
        # Приложения и меню
        "Super+Return".action = spawn "foot";
        "Alt+Space".action   = spawn "noctalia-shell" "toggle-launcher";

        # Управление окнами
        "Super+Q".action = close-window;
        "Super+F".action = fullscreen-window;
        "Super+W".action = toggle-overview;

        # Навигация по окнам в колонках
        "Super+Left".action  = focus-column-left;
        "Super+Right".action = focus-column-right;
        "Super+Up".action    = focus-window-up;
        "Super+Down".action  = focus-window-down;

        # Перемещение колонок
        "Super+Shift+Left".action  = move-column-left;
        "Super+Shift+Right".action = move-column-right;

        # Изменение ширины и высоты
        "Super+R".action           = switch-preset-column-width;
        "Super+Minus".action       = set-column-width "-10%";
        "Super+Equal".action       = set-column-width "+10%";
        "Super+Shift+Minus".action = set-window-height "-10%";
        "Super+Shift+Equal".action = set-window-height "+10%";

        # Рабочие столы (в Niri они расположены вертикально)
        "Super+Ctrl+Down".action       = focus-workspace-down;
        "Super+Ctrl+Up".action         = focus-workspace-up;
        "Super+Ctrl+Shift+Down".action = move-column-to-workspace-down;
        "Super+Ctrl+Shift+Up".action   = move-column-to-workspace-up;

        # Переход на конкретные столы
        "Ctrl+F1".action = focus-workspace 1;
        "Ctrl+F2".action = focus-workspace 2;
        "Ctrl+F3".action = focus-workspace 3;
        "Ctrl+F4".action = focus-workspace 4;

        # Скриншот выделенной области в буфер обмена
        "Super+Shift+S".action = spawn "sh" "-c" "grim -g \"$(slurp)\" - | wl-copy";
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
