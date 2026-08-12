{ config, self, ... }: let
  myWallpapersPath = "${self}/assets";
  darkWallpaper = "${myWallpapersPath}/dark_theme/nixos_wallpaper_dark.png";
  lightWallpaper = "${myWallpapersPath}/light_theme/nixos_wallpaper_light.png";
in {
  programs.noctalia = {
    enable = true;

    settings = {
      accessibility.ui_scale = 1.15;
      audio = {
        enable_sounds = true;
        volume = 1.0;
      };

      bar.default = {
        background_opacity = 0.85;
        center = [ "clock" "media" ];
        end = [
          "tray"
          "notifications"
          "clipboard"
          "keyboard_layout"
          "lock_keys"
          "volume"
          "network"
          "bluetooth"
          "brightness"
          "battery"
          "control-center"
          "session"
        ];
        font_family = "Inter Display";
        scale = 1.2;
        start = [
          "workspaces"
          "active_window"
          "audio_visualizer"
        ];
        widget_spacing = 12;
      };

      desktop_widgets = {
        schema_version = 2;
        widget_order = [ "desktop-widget-0000000000000001" ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget."desktop-widget-0000000000000001" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1720.0;
          cy = 720.0;
          output = "DP-2";
          rotation = 0.0;
          type = "sticker";
          settings = {
            image_path = "${myWallpapersPath}/eve1.png";
            opacity = 1.0;
          };
        };
      };

      dock = {
        background_opacity = 0.75;
        enabled = true;
        inactive_opacity = 0.9;
        layer = "top";
        magnification_scale = 1.65;
        radius = 40;
        radius_bottom_left = 8;
        radius_bottom_right = 8;
        radius_top_left = 80;
        reserve_space = false;
        show_dots = true;
        smart_auto_hide = true;
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };
          "lock-and-suspend" = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };
          "screen-off" = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };
        };
      };

      location.address = "Orenburg";

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [ "lockscreen-login-box@DP-2" ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget."lockscreen-login-box@DP-2" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 1720.0;
          cy = 1258.0;
          output = "DP-2";
          rotation = 0.0;
          type = "login_box";
          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
      };

      nightlight = {
        enabled = true;
        temperature_night = 6200;
      };

      notification = {
        background_opacity = 0.95;
        position = "top_center";
      };

      shell = {
        app_icon_color = "primary";
        font_family = "Inter";
        niri_overview_type_to_launch_enabled = true;
        clipboard_auto_paste = "off";
        panel_anchor_bar = "default";
        polkit_agent = true;
        telemetry_enabled = true;
        panel = {
          open_near_click_control_center = true;
          transparency_mode = "glass";
        };
        screenshot = {
          confirm_region = true;
          directory = "${config.home.homeDirectory}/Pictures/Screenshots";
          show_cursor = true;
        };
      };

      theme = {
        # builtin = "Noctalia";
        # community_palette = "Oxocarbon";
        mode = "auto";
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";
        templates = {
          builtin_ids = [ "gtk3" "gtk4" "niri" "qt" "kcolorscheme" "ghostty" "foot" "alacritty" ];
          community_ids = [ "discord" "telegram" "obsidian" "zed" "steam" "obs" ];
        };
      };

      wallpaper = {
        # directory = myWallpapersPath;
        default.path = lightWallpaper;
        # last.path = myDefaultWallpaper;
        directory_light = "${myWallpapersPath}/light_theme";
        directory_dark  = "${myWallpapersPath}/dark_theme";
        # monitors."DP-2".path = myDefaultWallpaper;
      };

      widget = {
        audio_visualizer.mirrored = false;
        clock.format = "{:%d %h %H:%M}";
        lock_keys.hide_when_off = true;
        media = {
          hide_when_no_media = true;
          title_scroll = "on_hover";
        };
      };
      clipboard = {

      };
      hooks = {
        theme_mode_changed = [
          ''
            if [ "$NOCTALIA_THEME_MODE" = "dark" ]; then
              noctalia msg wallpaper-set "${darkWallpaper}"
            else
              noctalia msg wallpaper-set "${lightWallpaper}"
            fi
          ''
        ];
        started = [
          ''
            if [ "$NOCTALIA_THEME_MODE" = "dark" ]; then
              noctalia msg wallpaper-set "${darkWallpaper}"
            else
              noctalia msg wallpaper-set "${lightWallpaper}"
            fi
          ''
        ];
      };
    };
  };
}
