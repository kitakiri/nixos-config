{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "kitakiri";
        email = "redjulius8@gmail.com";
      };
    };
  };
}
