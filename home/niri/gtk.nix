{ pkgs, ... }: {
  dconf.settings."org/gnome/desktop/wm/preferences" = {
    button-layout = ":";
  };
  gtk = {
    enable = true;

    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };
  };
}
