{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
  };

  imports = [
    ./github.nix
    ./vena.nix
  ];

}
