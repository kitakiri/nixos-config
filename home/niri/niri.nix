{ pkgs, config, ... }:

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
            natural-scroll
        }
        mouse {
            accel-speed 0.000000
            accel-profile "adaptive"
        }
    }

    output "DP-2" {
        transform "normal"
        mode "3440x1440@144.000000"
    }

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"
    prefer-no-csd

    overview {
        backdrop-color "#343456"
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
        Alt+M { spawn "noctalia" "msg" "mic-mute"; }
        Alt+Space { spawn "noctalia" "msg" "panel-toggle" "launcher"; }
        Alt+WheelScrollDown { focus-column-right; }
        Alt+WheelScrollUp { focus-column-left; }
        Ctrl+F1 { focus-workspace 1; }
        Ctrl+F2 { focus-workspace 2; }
        Ctrl+F3 { focus-workspace 3; }
        Ctrl+F4 { focus-workspace 4; }
        Super+C { spawn "noctalia" "msg" "panel-toggle" "clipboard"; }
        Super+Ctrl+Left { set-column-width "-10%"; }
        Super+Ctrl+Right { set-column-width "+10%"; }
        Super+Down { focus-workspace-down; }
        Super+E { spawn "nautilus"; }
        Super+F { fullscreen-window; }
        Super+L { spawn "noctalia" "msg" "session" "lock"; }
        Super+Left { focus-column-left; }
        Super+N { spawn "noctalia" "msg" "panel-toggle" "control-center"; }
        Super+Q { close-window; }
        Super+R { switch-preset-column-width; }
        Super+Right { focus-column-right; }
        Super+Shift+Down { move-column-to-workspace-down; }
        Super+Shift+Left { move-column-left; }
        Super+Shift+Right { move-column-right; }
        Super+Shift+S { spawn "noctalia" "msg" "screenshot-region"; }
        Super+Shift+Up { move-column-to-workspace-up; }
        Super+T { spawn "foot"; }
        Super+Up { focus-workspace-up; }
        Super+W { toggle-overview; }
        Super+WheelScrollDown { focus-workspace-down; }
        Super+WheelScrollUp { focus-workspace-up; }
        XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMute { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioPlay { spawn "playerctl" "play-pause"; }
        XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
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
