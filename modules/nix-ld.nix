{ pkgs,...}:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # --- C++ Runtime & системные зависимости ---
      stdenv.cc.cc.lib   # libstdc++.so.6
      zlib
      openssl
      curl

      # --- Графика и отрисовка (OpenGL / Vulkan) ---
      libGL
      vulkan-loader

      # --- Стек X11 и устройства ввода ---
      xorg.libX11        # libX11.so.6
      xorg.libXcursor    # libXcursor.so.1
      xorg.libXrandr
      xorg.libXext
      xorg.libXi
      xorg.libXinerama
      xorg.libXrender
      xorg.libXfixes
      xorg.libXdamage
      xorg.libXtst
      libxkbcommon       # libxkbcommon.so.0

      # --- Звук, геймпады и системные шины ---
      alsa-lib
      libpulseaudio      # Звук через PulseAudio / PipeWire
      udev               # Для геймпадов и джойстиков
      dbus

      # --- GTK3 / GLib (для лаунчера) ---
      gtk3
      glib
      cairo
      pango
      gdk-pixbuf
      atk

      # --- Шрифты ---
      # fontconfig
      freetype
    ];
  };
}
