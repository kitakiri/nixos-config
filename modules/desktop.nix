{ pkgs, ... }:

{

  # services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;




  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = "breeze";
  };

  environment.etc."sddm/themes/breeze/theme.conf.user".text = ''
    [General]
    background=${../assets/wallhaven-8o2lm2_6000x3375.png}
  '';
}
