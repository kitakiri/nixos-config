{ pkgs, ... }:

{
  home.packages = with pkgs.kdePackages; [
    kate
    kompare
    kcalc
    ark
    filelight
    kcolorchooser
    isoimagewriter
    dragon
  ];
}
