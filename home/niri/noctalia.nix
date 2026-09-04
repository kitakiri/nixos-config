{ config, self, hostname, lib, ... }: let
  myWallpapersPath = "${self}/assets";
  darkWallpaper = "${myWallpapersPath}/dark_theme/nixos_wallpaper_dream_dark.png";
  lightWallpaper = "${myWallpapersPath}/light_theme/nixos_wallpaper_dream.png";
  monitorName = config.myOptions.monitor.name;
  centerX     = config.myOptions.monitor.width / 2.0;
  centerY     = config.myOptions.monitor.height / 2.0;

  applyWallpaperScript = ''
    if [ "$NOCTALIA_THEME_MODE" = "dark" ]; then
      noctalia msg wallpaper-set "${darkWallpaper}"
    else
      noctalia msg wallpaper-set "${lightWallpaper}"
    fi
  '';
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
        background_opacity = 0.6;
        start = [
          "workspaces"
          "active_window"
          "audio_visualizer"
          "privacy"
        ];
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
          "session"
        ];
        font_family = "Inter Display";
        scale = 1.2;
        widget_spacing = 12;
        concave_edge_corners = false;
        radius = 8;
        radius_top_left = 24;
        radius_top_right = 24;
        radius_bottom_left = 24;
        radius_bottom_right = 24;
      } // lib.optionalAttrs (hostname == "asuslaptop") {
        margin_ends = 12;

        radius_top_left = 0;
        radius_top_right = 0;
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
          cx = centerX;
          cy = centerY;
          output = "${monitorName}";
          rotation = 0.0;
          type = "sticker";
          settings = {
            image_path = "${myWallpapersPath}/eve1.png";
            opacity = 1.0;
          };
        };
      };

      dock = {
        background_opacity = 0.6;
        enabled = true;
        inactive_opacity = 0.9;
        layer = "top";
        magnification_scale = 1.65;
        reserve_space = false;
        show_dots = true;
        smart_auto_hide = true;
        radius = 16;
        radius_top_left = 16;
        radius_top_right = 16;
        radius_bottom_left = 16;
        radius_bottom_right = 16;
        concave_edge_corners = false;
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
        widget_order = [ "lockscreen-login-box@${monitorName}" ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget."lockscreen-login-box@${monitorName}" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = centerX;
          cy = centerY;
          output = "${monitorName}";
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
        background_opacity = 0.75;
        position = "top_center";
      };

      osd = {
        enable = true;
        background_opacity = 0.60;
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
          builtin_ids = [ "gtk3" "gtk4" "niri" "qt" "kcolorscheme" "foot" ];
          community_ids = [ "pywalfox-beta4" "discord" "telegram" "obsidian" "zed" ];
        };
      };

      wallpaper = {
        default.path = lightWallpaper;
        directory_light = "${myWallpapersPath}/light_theme";
        directory_dark  = "${myWallpapersPath}/dark_theme";
      };

      widget = {
        privacy = {
          hide_inactive = true;
        };
        audio_visualizer.mirrored = false;
        clock.format = "{:%d %h %H:%M}";
        lock_keys.hide_when_off = true;
        media = {
          hide_when_no_media = true;
          title_scroll = "on_hover";
        };
      };

      # для прозрачности и блюра в режиме обзора
      backdrop = {
        enabled = true;
        blur_intensity = 1.6;
        tint_intensity = 0.5;
      };

      clipboard = {
        store_images = true;
        ignore_passwords = false;
        clear_on_lock = false;
      };
      hooks = {
        theme_mode_changed = [ applyWallpaperScript ];
        started = [ applyWallpaperScript ];
      };
    };
  };
}
