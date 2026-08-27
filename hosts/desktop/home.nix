{
  username,
  myHome,
  ...
}: {
  imports = [
    "${myHome}/core/default.nix"
    "${myHome}/nix/default.nix"
    "${myHome}/niri/default.nix"
    "${myHome}/defaultApps/default.nix"
    "${myHome}/programs/default.nix"
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # компьютер с этой ОС был развернут на версии 26.05
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
