{ pkgs, ... }: {
  home.packages = with pkgs; [
    kdePackages.kdenlive
    ffmpeg
    frei0r
  ];
}
