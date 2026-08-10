{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    morewaita-icon-theme
    adwaita-icon-theme
    kdePackages.breeze-icons
  ];
}
