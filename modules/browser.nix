{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.kitakiri = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
      ];
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
      };
    };
  };
}
