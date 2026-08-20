{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    spotdl
  ];
}
