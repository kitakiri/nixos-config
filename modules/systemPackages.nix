{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nixd
    nano
    wget
    curl
    qpwgraph # аналог Helvum
    helvum
    qbittorrent
    htop
    btop
    tldr # настроил обнову в home/fish.nix
    mission-center
    kdePackages.partitionmanager
    kdePackages.filelight
  ];
}
