{ ... }: {
  programs.ghostty = {
    enable = true;

    # Интеграция с вашим шеллом (zsh, bash или fish)
    enableZshIntegration = true;

    settings = {
      # Noctalia генерирует тему в файле темы Ghostty
      theme = "noctalia";

      # Внешний вид и шрифт
      font-family = "Inter Display";
      font-size = 11;

      # Отключаем рамки окна (Niri сам управляет границами)
      window-decoration = false;

      # Рендеринг и Wayland
      gtk-single-instance = true;
      confirm-close-surface = false;
    };
  };
}
