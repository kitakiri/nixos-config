{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nixd
    nano
    wget
    curl
    qpwgraph # аналог Helvum
    helvum
    # xray
    qbittorrent
    htop
    btop
    tldr # настроил обнову в home/fish.nix
  ];
}
