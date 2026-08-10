{ pkgs, ... }: {
  home.packages = with pkgs; [
    jetbrains.rider
    dotnetCorePackages.sdk_8_0
  ];
}
