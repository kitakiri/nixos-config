{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nano
    wget
    curl
    qpwgraph # аналог Helvum
    xray
    qbittorrent
    htop btop
    tldr # настроил обнову в home/fish.nix
  ];
}
