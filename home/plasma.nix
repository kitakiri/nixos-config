{ pkgs, ... }:

{
  #programs.plasma.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.kdePackages.breeze;
    name = "Breeze";
    size = 36;
  };


  home.sessionVariables = {
    XCURSOR_THEME = "Breeze";
    XCURSOR_SIZE = "36";
  };
}
