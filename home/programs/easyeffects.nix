{ pkgs, ... }: {
  services.easyeffects = {
    enable = true;
    package = pkgs.easyeffects;

    # preset = "my-microphone";

    extraPresets = {

    };
  };
}
