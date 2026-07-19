{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  services.displayManager.plasma-login-manager = {
    enable = true;

    settings = {
      "Greeter" = {
        PreselectedUser = "kitakiri";
      };

      "Greeter][Wallpaper][org.kde.image][General" = {
        Image = "file://${../assets/wallhaven-8o2lm2_6000x3375.png}";
      };
    };
  };
}
