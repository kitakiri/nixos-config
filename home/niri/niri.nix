{ pkgs, config, lib, ... }:

let
  niriConfigPath = "${config.home.homeDirectory}/.config/niri/";
  configNiriKdl = ''
    input {
        keyboard {
            xkb {
                layout "us,ru"
                options "grp:caps_toggle"
            }
            repeat-delay 600
            repeat-rate 25
            track-layout "global"
        }
        touchpad {
            tap
            tap-button-map "left-right-middle"
            natural-scroll
            // dwt
        }
        mouse {
            accel-speed 0.000000
            accel-profile "adaptive"
        }
    }

    output "${config.myOptions.monitor.name}" {
        transform "normal"
        // mode "3440x1440@144.000"
        ${lib.optionalString (config.myOptions.monitor.mode != null) ''mode "${config.myOptions.monitor.mode}"''}
    }

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
    prefer-no-csd

    overview {
        backdrop-color "#7c86b8"
    }

    // Темы с рамками от noctalia
    include optional=true "${niriConfigPath}/noctalia.kdl"
    layout {
        gaps 12
        struts {
            left 0
            right 0
            top 0
            bottom 0
        }
        focus-ring {
            on
            width 2
        }
        border {
            on
            width 5
        }
        shadow {
            on
            offset x=2 y=4
            softness 25
            spread 10
            draw-behind-window false
        }
        tab-indicator {
            gap 5.000000
            width 4.000000
            length total-proportion=0.500000
            position "left"
            gaps-between-tabs 0.000000
            corner-radius 0.000000
        }
        default-column-width
        center-focused-column "never"
    }

    cursor {
        xcursor-theme "macOS"
        xcursor-size 32
    }

    hotkey-overlay {
        skip-at-startup
    }

    binds {
        // 1. Приложения (Applications)
        Super+T { spawn "foot"; }
        Super+E { spawn "nautilus"; }

        // 2. Noctalia Shell & Системные модули
        Alt+Space { spawn "noctalia" "msg" "panel-toggle" "launcher"; }
        Super+C { spawn "noctalia" "msg" "panel-toggle" "clipboard"; }
        Super+N { spawn "noctalia" "msg" "panel-toggle" "control-center"; }
        Super+Shift+S { spawn "noctalia" "msg" "screenshot-region"; }
        Super+L { spawn "noctalia" "msg" "session" "lock"; }

        // 3. Управление окнами и колонками
        Super+Q { close-window; }
        Super+F { fullscreen-window; }
        Ctrl+Shift+T { toggle-window-floating; }
        Super+R { switch-preset-column-width; }
        Super+Ctrl+Left { set-column-width "-10%"; }
        Super+Ctrl+Right { set-column-width "+10%"; }

        // 4. Фокус и перемещение колонок/окон
        Super+Left { focus-column-left; }
        Super+Right { focus-column-right; }
        Alt+WheelScrollUp { focus-column-left; }
        Alt+WheelScrollDown { focus-column-right; }
        Super+Shift+Left { move-column-left; }
        Super+Shift+Right { move-column-right; }

        // 5. Воркспейсы и Режим обзора
        Super+W { toggle-overview; }
        Super+Up { focus-workspace-up; }
        Super+Down { focus-workspace-down; }
        Super+WheelScrollUp { focus-workspace-up; }
        Super+WheelScrollDown { focus-workspace-down; }
        Super+Shift+Up { move-column-to-workspace-up; }
        Super+Shift+Down { move-column-to-workspace-down; }
        Ctrl+F1 { focus-workspace 1; }
        Ctrl+F2 { focus-workspace 2; }
        Ctrl+F3 { focus-workspace 3; }
        Ctrl+F4 { focus-workspace 4; }

        // 6. Звук и медиауправление
        XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
        XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioPlay { spawn "playerctl" "play-pause"; }
        Alt+M { spawn "noctalia" "msg" "mic-mute"; }
    }

    spawn-at-startup "noctalia"

    window-rule {
        match app-id="^firefox$" title="^Picture-in-Picture$"
        default-column-width { fixed 640; }
        default-window-height { fixed 360; }
        open-floating true
    }

    window-rule {
        match app-id="^org.telegram.desktop$"
        block-out-from "screen-capture"
    }

    window-rule {
        match app-id="^steam$" title="^notificationtoasts_\\d+_desktop$"
        open-focused false
        default-floating-position x=12 y=12 relative-to="bottom-right"
    }


    window-rule {
        match app-id="^org.gnome.Nautilus$"

        draw-border-with-background false
        opacity 0.9

        background-effect {
            xray true // xray true с просветом на рабочий стол более дешевый к gpu
            blur true
        }
        popups {
            geometry-corner-radius 15
            opacity 0.85
            background-effect {
                xray false
                blur true
            }
        }
    }

    layer-rule {
        match layer="top"
        match layer="overlay"

        background-effect {
            xray false
        }
    }
  '';
  configFile = pkgs.writeText "config.kdl" configNiriKdl;
in

{
  xdg.configFile."niri/config.kdl".source =
    pkgs.runCommand "niri-config-checked"
      {
        nativeBuildInputs = [ pkgs.niri ];
      }
      ''
        niri validate --config ${configFile}
        cp ${configFile} $out
      '';

  home.packages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    playerctl
  ];
}
