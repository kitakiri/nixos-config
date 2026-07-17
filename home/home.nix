{ config, pkgs, ... }:

{

  imports = [

    ./git.nix

    ./ssh/ssh.nix

  ];


  home.username = "kitakiri";

  home.homeDirectory = "/home/kitakiri";


  home.stateVersion = "26.05";


  programs.home-manager.enable = true;

}
