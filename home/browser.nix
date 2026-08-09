# { pkgs, ... }:
{
  pkgs,
  inputs,
  username,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles.${username} = {
      # Настройки из about:config
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;
      };

      extensions = {
        packages = with inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
    };
  };
}
