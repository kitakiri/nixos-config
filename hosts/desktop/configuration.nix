{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/gc.nix
    ../../modules/networking.nix
    ../../modules/kdeConnect.nix
    ../../modules/localization.nix
    ../../modules/desktop.nix
    ../../modules/fonts.nix
    ../../modules/sound/sound.nix
    ../../modules/printing.nix
    ../../modules/users.nix
    ../../modules/sandbox.nix
    ../../modules/fish.nix
    ../../modules/systemPackages.nix

    ../../modules/gaming.nix
    ../../modules/nix-ld.nix

    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/bluetooth.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    substituters = [
      "https://cache.nixos.kz/"
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
    ];
  };
  nixpkgs.config.allowUnfree = true;
  # система была установлена с 26.05
  system.stateVersion = "26.05";


  # кастомные модули:
  # Включаем daw , уменьшаем задержки, включаем софт для гитары и группу audio
  modules.sound.music.enable = true;
}
