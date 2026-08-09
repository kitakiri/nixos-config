{
  myModules,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${myModules}/hardware/nvidia.nix"
    "${myModules}/hardware/bluetooth.nix"

    "${myModules}/boot.nix"
    "${myModules}/gc.nix"
    "${myModules}/networking"
    "${myModules}/kdeConnect.nix"
    "${myModules}/localization.nix"
    "${myModules}/desktop/niri/default.nix"
    "${myModules}/desktop/filemanager.nix"
    "${myModules}/fonts.nix"
    "${myModules}/icons.nix"
    "${myModules}/sound/sound.nix"
    "${myModules}/printing.nix"
    "${myModules}/users.nix"
    "${myModules}/sandbox.nix"
    "${myModules}/fish.nix"
    "${myModules}/systemPackages.nix"
    # ${myModules}/sessionVariables.nix

    "${myModules}/gaming.nix"
    "${myModules}/nix-ld.nix"
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://cache.nixos.kz/"
      "https://cache.nixos.org/"

    ];

  };
  nixpkgs.config.allowUnfree = true;
  # система была установлена с 26.05
  system.stateVersion = "26.05";


  # кастомные модули:
  # Включаем daw , уменьшаем задержки, включаем софт для гитары и группу audio
  modules.sound.music.enable = true;
}
