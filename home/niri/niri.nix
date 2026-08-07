{
  config,
  pkgs,
  ...
}: {
  programs.niri = {
    enable = true;
    settings = {
      overview = {
        backdrop-color = "#131318";
      };
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
      layout = {
        gaps = 12;
        border = {
          enable = true;
          width = 5;

          active.color = "#9b37af";
          inactive.color = "#c1c1ff";
          urgent.color = "#ffb4ab";
        };
        focus-ring = {
          enable = true;
          width = 3;
          active.color = "#9b37af";
          #inactive.color = "#e8e1ea";
          urgent.color = "#fd4663";
        };
        shadow = {
          enable = true;
          softness = 25;
          spread = 10;
          offset = { x = 2; y = 4; };
          color = "#00000070";
        };
        tab-indicator = {
          active.color = "#c1c1ff";
          inactive.color = "#404178";
          urgent.color = "#ffb4ab";
        };
        insert-hint = {
          enable = true;
          display.color = "#c1c1ff80";
        };
      };
      #
      # Мониторы
      #
      outputs = {
        "DP-2" = {
          mode = {
            width = 3440;
            height = 1440;
            refresh = 144.0;
          };
        };
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

      cursor = {
        theme = "macOS";
        size = 32;
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
        "Super+T".action = spawn "foot";
        "Super+E".action = spawn "nautilus";
        "Alt+Space".action = spawn "noctalia" "msg" "panel-toggle" "launcher";
        "Super+N".action = spawn "noctalia" "msg" "panel-toggle" "control-center";
        "Super+C".action = spawn "noctalia" "msg" "panel-toggle" "clipboard";
        "Super+L".action = spawn "noctalia" "msg" "session" "lock";

        # Управление окнами
        "Super+Q".action = close-window;
        "Super+F".action = fullscreen-window;
        "Super+W".action = toggle-overview;

        # Навигация по окнам в колонках
        "Super+Left".action  = focus-column-left;
        "Super+Right".action = focus-column-right;
        "Alt+WheelScrollUp".action  = focus-column-left;
        "Alt+WheelScrollDown".action = focus-column-right;
        # "Super+Up".action    = focus-window-up;
        # "Super+Down".action  = focus-window-down;

        # Перемещение колонок
        "Super+Shift+Left".action  = move-column-left;
        "Super+Shift+Right".action = move-column-right;

        # Изменение ширины и высоты
        "Super+R".action           = switch-preset-column-width;
        "Super+Ctrl+Left".action   = set-column-width "-10%";
        "Super+Ctrl+Right".action  = set-column-width "+10%";

        # Рабочие столы (в Niri они расположены вертикально)
        "Super+Down".action       = focus-workspace-down;
        "Super+Up".action         = focus-workspace-up;
        "Super+WheelScrollDown".action       = focus-workspace-down;
        "Super+WheelScrollUp".action         = focus-workspace-up;
        "Super+Shift+Down".action = move-column-to-workspace-down;
        "Super+Shift+Up".action   = move-column-to-workspace-up;

        # Переход на конкретные столы
        "Ctrl+F1".action = focus-workspace 1;
        "Ctrl+F2".action = focus-workspace 2;
        "Ctrl+F3".action = focus-workspace 3;
        "Ctrl+F4".action = focus-workspace 4;

        # Системные клавиши
        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
        "XF86AudioMute".action        = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioPlay".action        = spawn "playerctl" "play-pause";

        # Скриншот выделенной области в буфер обмена
        "Super+Shift+S".action = spawn "noctalia" "msg" "screenshot-region";

        # Переключение микрофона
        "Alt+M".action = spawn "noctalia" "msg" "mic-mute";
      };

      #
      # Правила окон
      #
      window-rules = [
        {
          matches = [ { app-id = "^firefox$"; title = "^Picture-in-Picture$"; } ];
          open-floating = true;
          default-column-width = { fixed = 640; };
          default-window-height = { fixed = 360; };
        }
        # Защита персональных данных при демонстрации экрана
        {
          matches = [
            { app-id = "^org.telegram.desktop$"; }
          ];
          block-out-from = "screen-capture";
        }
      ];

      #
      # Автозапуск
      #
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];
    };
  };

  home.packages = with pkgs; [
    foot
    xwayland-satellite
    wl-clipboard
    # brightnessctl
    playerctl
  ];
}
