{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    inter
  ];

  fonts.fontconfig = {
    enable = true;
  };
}
