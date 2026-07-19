{ ... }:

{
  programs.plasma = {
    enable = true;

    configFile = {
      kdeglobals = {
        General = {
          XftAntialias = true;
          XftHintStyle = "hintslight";
          XftSubPixel = "rgb";
        };
      };
    };
  };
}
