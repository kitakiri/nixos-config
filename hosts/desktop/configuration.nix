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
    ../../modules/desktop/niri/default.nix
    ../../modules/fonts.nix
    ../../modules/icons.nix
    ../../modules/sound/sound.nix
    ../../modules/printing.nix
    ../../modules/users.nix
    ../../modules/sandbox.nix
    ../../modules/fish.nix
    ../../modules/systemPackages.nix
    # ../../modules/sessionVariables.nix

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
    substituters = [
      "https://noctalia.cachix.org"
      "https://niri.cachix.org"
      "https://cache.nixos.kz/"
      "https://cache.nixos.org/"

    ];
    trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "niri.cachix.org-1:W43zgB3z572LgSm0qCdgQXYGZ2yXMh86e8vKBL128yX="
    ];
  };
  nixpkgs.config.allowUnfree = true;
  # система была установлена с 26.05
  system.stateVersion = "26.05";


  # кастомные модули:
  # Включаем daw , уменьшаем задержки, включаем софт для гитары и группу audio
  modules.sound.music.enable = true;
}
