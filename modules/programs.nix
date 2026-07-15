{ pkgs, ... }:

{

  programs.firefox.enable = true;

  #programs.git.enable = true; # вкл в /home/git.nix

  environment.systemPackages = with pkgs; [
    git
  ];

}
