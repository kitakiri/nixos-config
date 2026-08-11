{ pkgs, self, ... }: let
  myWallpapersPath = "${self}/assets";
  myDefaultWallpaper = "${myWallpapersPath}/wallhaven-8o2lm2_6000x3375.png";
in {
  programs.noctalia-greeter = {
    enable = true;

    # Optional configuration
    greeter-args = "";
    # Full declarative greeter.toml (overwritten on each activation).
    # See examples/greeter.toml for every key (appearance.palette, output, …).
    settings = {
      cursor = {
        theme = "macOS";
        size = 24;
        path = "${pkgs.apple-cursor}/share/icons";
      };
      keyboard = {
        layout = "us";
      };
      appearance = {
        wallpaper = {
          path = myDefaultWallpaper;
          fill_mode = "crop";
        };
      };
    };
  };
}
