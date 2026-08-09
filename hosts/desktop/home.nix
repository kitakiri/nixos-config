{
  username,
  ...
}: {
  imports = [
    ../../home/core/default.nix
    ../../home/browser.nix
    ../../home/obs.nix
    ../../home/packages.nix
    ../../home/niri/default.nix
    ../../home/lutris.nix
    ../../home/defaultApps/default.nix
    ../../home/vesktop.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # компьютер с этой ОС был развернут на версии 26.05
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
