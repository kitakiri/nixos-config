{ config, pkgs, ... }:

{
  imports = [

    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/gc.nix
    ../../modules/networking.nix
    ../../modules/localization.nix
    ../../modules/desktop.nix
    ../../modules/fonts.nix
    ../../modules/sound.nix
    ../../modules/printing.nix
    ../../modules/users.nix
    ../../modules/sandbox.nix
    ../../modules/fish.nix
    ../../modules/systemPackages.nix

    ../../modules/gaming.nix

    ../../modules/hardware/nvidia.nix

  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://cache.nixos.kz/"
    # "https://cache.nixos.org/"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  # система была установлена с 26.05
  system.stateVersion = "26.05";

}
