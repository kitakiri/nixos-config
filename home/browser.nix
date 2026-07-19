# { pkgs, ... }:

{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.kitakiri = {
      # Настройки из about:config
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;
      };

      extensions = {
        packages =
          with inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons;
          [
            ublock-origin
            bitwarden
          ];
      };
    };
  };
}


#{ pkgs, ... }:

#{
#  programs.firefox = {
#    enable = true;
#    profiles.kitakiri = {
#      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#        ublock-origin
#        bitwarden
#      ];
#      settings = {
#        "browser.startup.homepage" = "https://nixos.org";
#      };
#    };
#  };
#}
