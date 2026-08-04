{
  inputs,
  ...
}: {

  # imports = [
  #   inputs.noctalia.homeModules.default
  # ];

  programs.noctalia-shell = {

    enable = true;

    settings = {

      #
      # Панель
      #
      bar = {

      };

      #
      # Dock
      #
      dock = {

      };

      #
      # Launcher
      #
      launcher = {

      };

      #
      # Clipboard
      #
      clipboard = {

      };

      #
      # Notifications
      #
      notifications = {

      };

      #
      # Widgets
      #
      widgets = {

      };

      #
      # Theme
      #
      theme = {

      };
    };
  };
}
