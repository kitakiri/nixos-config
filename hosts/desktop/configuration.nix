{ config, pkgs, ... }:

{
  imports = [

    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/gc.nix
    ../../modules/networking.nix
    ../../modules/xray.nix
    # ../../modules/zapret.nix      # ZAPRET врубаю !!! !!!
    ../../modules/localization.nix
    ../../modules/desktop.nix
    ../../modules/fonts.nix
    # ../../modules/cursor.nix
    ../../modules/sound.nix
    ../../modules/printing.nix
    ../../modules/users.nix
    ../../modules/sandbox.nix
    ../../modules/programs.nix
    ../../modules/systemPackages.nix

    ../../modules/gaming.nix

    ../../modules/hardware/nvidia.nix

  ];

  #nix.settings.experimental-features = [
  #  "nix-command"
  #  "flakes"
  #];

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

  system.stateVersion = "26.05";

}
