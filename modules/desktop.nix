{pkgs, ...}: {
  # services.desktopManager.plasma6.enable = true;
  # services.displayManager.plasma-login-manager.enable = true;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
