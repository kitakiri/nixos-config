{
  myModules,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${myModules}/hardware/nvidia.nix"
    "${myModules}/hardware/bluetooth.nix"
    "${myModules}/hardware/printing.nix"

    #"${myModules}/boot.nix"
    # "${myModules}/systemPackages.nix"
    # "${myModules}/sessionVariables.nix"
    # "${myModules}/localization.nix"
    # "${myModules}/networking.nix"
    # "${myModules}/users.nix"
    # "${myModules}/gc.nix"
    # "${myModules}/nix-ld.nix"
    # # "${myModules}/fonts.nix"
    # "${myModules}/icons.nix"


    "${myModules}/core/default.nix"
    "${myModules}/nix/default.nix"
    "${myModules}/sound/default.nix"
    "${myModules}/appearance/default.nix"

    "${myModules}/desktop/niri/default.nix"
    "${myModules}/desktop/filemanager.nix"

    "${myModules}/programs/kdeConnect.nix"
    "${myModules}/programs/sandbox.nix"
    "${myModules}/programs/gaming.nix"
    "${myModules}/programs/droidcam.nix"

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
