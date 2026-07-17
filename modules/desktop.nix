{ ... }:

let
    wallpaper = ../assets/wallhaven-8o2lm2_6000x3375.png;
in

{

  # services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;

  # services.displayManager.sddm.enable = true;
  # services.displayManager.plasma-login-manager.enable = true;


  services.displayManager.plasma-login-manager = {
    enable = true;

    settings = {
      Greeter.Wallpaper.org.kde.image = {
        Image = "file://${wallpaper}";
      };
    };
  };
}
