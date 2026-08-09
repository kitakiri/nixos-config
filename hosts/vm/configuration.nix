{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/boot.nix
    ../../modules/networking
    ../../modules/localization.nix
    ../../modules/desktop.nix
    ../../modules/sound.nix
    ../../modules/printing.nix
    ../../modules/users.nix
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
