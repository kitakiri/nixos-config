{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # --- C++ Runtime & системные зависимости ---
      stdenv.cc.cc.lib # libstdc++.so.6
      zlib
      openssl
      curl

      # --- Графика и отрисовка (OpenGL / Vulkan) ---
      libGL
      vulkan-loader

      # --- Стек X11 и устройства ввода ---
      libx11 # libX11.so.6
      libxcursor # libXcursor.so.1
      libxrandr
      libxext
      libxi
      libxinerama
      libxrender
      libxfixes
      libxdamage
      libxtst
      libxkbcommon # libxkbcommon.so.0

      # --- Звук, геймпады и системные шины ---
      alsa-lib
      libpulseaudio # Звук через PulseAudio / PipeWire
      udev # Для геймпадов и джойстиков
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
