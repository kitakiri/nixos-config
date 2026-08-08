{
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

    # ./plasma/plasma.nix
    ./niri/default.nix
    # ./emulation.nix
    ./lutris.nix
    ./terminal.nix
    #./filemanager.nix
    #./texteditor.nix
    ./defaultApps/default.nix
    # ./kdeApps.nix
    ./vesktop.nix
  ];

  home.username = "kitakiri";

  home.homeDirectory = "/home/kitakiri";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
