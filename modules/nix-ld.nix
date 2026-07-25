{ pkgs,...}:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # --- Закрывает выходы из вашего ldd ---
      stdenv.cc.cc.lib # libstdc++.so.6
      gtk3             # libgtk-3.so.0, libgdk-3.so.0
      glib             # libglib-2.0.so.0, libgobject-2.0.so.0, libgio-2.0.so.0
      xorg.libX11      # libX11.so.6
      xorg.libXrandr   # libXrandr.so.2

      # --- Спутники GTK3 (нужны для отрисовки интерфейса лаунчера) ---
      cairo
      pango
      gdk-pixbuf
      atk

      # --- Графика, звук и шрифты (потребуются при старте самой игры) ---
      libGL
      vulkan-loader
      alsa-lib
      fontconfig
      freetype
      dbus
      zlib

      # --- Дополнительные модули X11 для игр ---
      xorg.libXext
      xorg.libXcursor
      xorg.libXi
      xorg.libXinerama
      xorg.libXrender
      xorg.libXfixes
    ];
  };
}
