# { pkgs, ... }:
{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles.kitakiri = {
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
