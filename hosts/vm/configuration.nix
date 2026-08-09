{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/core/boot.nix
    ../../modules/core/networking.nix
    ../../modules/core/localization.nix
    ../../modules/desktop.nix
    ../../modules/sound.nix
    ../../modules/hardware/printing.nix
    ../../modules/core/users.nix
    ../../modules/programs.nix
    ../../modules/virtualization.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
