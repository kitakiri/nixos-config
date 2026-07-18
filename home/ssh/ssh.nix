{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };

  imports = [
    ./github.nix
    ./vena.nix
  ];

}
