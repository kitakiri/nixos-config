{ ... }:

{
  programs.plasma = {
    enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.kdePackages.breeze;
    name = "Breeze";
    size = 36;
  };

}
