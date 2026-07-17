{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    discord
    obsidian
    zed-editor
    fastfetch
    kdePackages.kate
  ];
}
