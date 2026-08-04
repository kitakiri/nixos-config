{config, pkgs, ...}:
let
  sessions = "${config.services.displayManager.sessionData.desktops}/share";
in
{
  # services.desktopManager.plasma6.enable = true;
  # services.displayManager.plasma-login-manager.enable = true;

  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;




  environment.systemPackages = with pkgs; [
      xwayland-satellite
  ];
  # systemd.user.services.niri.enableDefaultPath = false;

  programs.niri.enable = true;

  services.greetd = {
    enable = true;

    settings.default_session = {
      user = "greeter";

      command = ''
        ${pkgs.tuigreet}/bin/tuigreet \
          --time \
          --remember \
          --remember-user-session \
          --user-menu \
          --sessions ${sessions}/wayland-sessions \
          --xsessions ${sessions}/xsessions
      '';
    };
  };
}
