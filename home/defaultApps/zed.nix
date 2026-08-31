{ ... }: {
  programs.zed-editor = {
    enable = true;

    # Home Manager сам скачает и установит эти расширения,
    # заменяя логику auto_install_extensions из обычного json
    extensions = [
      "nix"
      "go"
      "rust"
      "mcp-server-context7"
    ];

    userSettings = {
      load_direnv = "shell_hook";
      project_panel = {
        dock = "left";
      };
      agent = {
        dock = "right";
        favorite_models = [];
        model_parameters = [];
      };

      # Явное включение и настройка MCP-серверов
      context_servers = {
        "mcp-server-context7" = {
          enabled = true;
        };
      };

      # Внешний вид
      theme = {
        mode = "system";
        dark = "One Dark";
        light = "One Light";
      };

      # Шрифты
      ui_font_family = "Inter";
      buffer_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 18;
      buffer_font_size = 14;
    };
  };
}
