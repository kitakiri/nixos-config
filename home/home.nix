{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./xdg.nix

    ./git.nix
    ./ssh/ssh.nix
    ./fish.nix

    ./browser.nix
    ./obs.nix
    ./zed.nix

    ./packages.nix

    ./plasma/plasma.nix

    ./emulation.nix
  ];

  home.username = "kitakiri";

  home.homeDirectory = "/home/kitakiri";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
