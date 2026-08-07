{config, pkgs, ...}:
let
  sessions = "${config.services.displayManager.sessionData.desktops}/share";
in
{
  environment.systemPackages = with pkgs; [
      xwayland-satellite
  ];
  # systemd.user.services.niri.enableDefaultPath = false;

  programs.niri.enable = true;

  # Включаем GVFS для корректной работы Nautilus в Niri
  services.gvfs.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "greeter";
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --user-menu --sessions ${sessions}/wayland-sessions --xsessions ${sessions}/xsessions";
    };
  };
}
