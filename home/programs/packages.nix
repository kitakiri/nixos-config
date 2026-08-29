{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    # discord # заменил на flatpak из-за krisp
    obsidian
    fastfetch
    krita
    bazaar
    meld
    wget
    curl
    qpwgraph # аналог Helvum
    helvum
    qbittorrent
    htop
    btop
    tldr # настроил обнову в home/fish.nix
    mission-center
    kdePackages.filelight
  ];
}
