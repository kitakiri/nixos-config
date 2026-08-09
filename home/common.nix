{
  username,
  ...
}: {
  imports = [
    ./xdg.nix
    ./git.nix
    ./ssh/ssh.nix
    ./fish.nix
    ./zed.nix
    ./terminal.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
