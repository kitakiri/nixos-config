{ config, pkgs, ... }:

{

  imports = [

    ./xdg.nix

    ./git.nix

    ./ssh/ssh.nix

    ./browser.nix

    ./packages.nix

    ./plasma.nix

    ./fonts.nix
  ];


  home.username = "kitakiri";

  home.homeDirectory = "/home/kitakiri";


  home.stateVersion = "26.05";


  programs.home-manager.enable = true;

}
