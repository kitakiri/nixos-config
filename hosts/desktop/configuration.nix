{
  myModules,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${myModules}/hardware/nvidia.nix"
    "${myModules}/hardware/bluetooth.nix"

    "${myModules}/core/boot.nix"
    "${myModules}/nix/gc.nix"
    "${myModules}/core/networking.nix"
    "${myModules}/programs/kdeConnect.nix"
    "${myModules}/core/localization.nix"
    "${myModules}/desktop/niri/default.nix"
    "${myModules}/desktop/filemanager.nix"
    "${myModules}/appearance/fonts.nix"
    "${myModules}/appearance/icons.nix"
    "${myModules}/sound/sound.nix"
    "${myModules}/hardware/printing.nix"
    "${myModules}/core/users.nix"
    "${myModules}/programs/sandbox.nix"
    "${myModules}/programs/fish.nix"
    "${myModules}/core/systemPackages.nix"
    # ${myModules}/core/sessionVariables.nix

    "${myModules}/programs/gaming.nix"
    "${myModules}/nix/nix-ld.nix"
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
