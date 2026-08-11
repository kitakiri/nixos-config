{ ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=14";
        pad = "10x10";
        include = "~/.config/foot/themes/noctalia";
      };

      colors-dark = {
        alpha = "0.85";
        blur = true;
      };

      key-bindings = {
        # Страницы
        scrollback-up-page = "Shift+Page_Up Home";
        scrollback-down-page = "Shift+Page_Down End";

        # Полстраницы / Home / End
        scrollback-up-half-page = "Page_Up";
        scrollback-down-half-page = "Page_Down";

        # Построчно
        scrollback-up-line = "Shift+Up";
        scrollback-down-line = "Shift+Down";
      };
    };
  };
}
