{...}: {
  programs.devenv = {
    enable = true;
    enableFishIntegration = false; # с true попадает в бесконечную рекурсию из-за специфики моего modules/core/fish.nix
  };
}
