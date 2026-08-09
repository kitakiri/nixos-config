{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    # discord # заменил на flatpak из-за krisp
    obsidian
    fastfetch
    krita
    bazaar
    meld
  ];
}
