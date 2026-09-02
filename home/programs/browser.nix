{
  pkgs,
  inputs,
  username,
  ...
}: {
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [
      pkgs.pywalfox-native
    ];
    profiles.${username} = {
      # Настройки из about:config
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;
      };

      extensions = {
        packages = with inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          pywalfox
        ];
      };
    };
  };

  # Ассоциации MIME-типов для Firefox
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
