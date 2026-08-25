{ myModules, ... }: {
  imports = [
    ./hardware-configuration.nix

    "${myModules}/hardware/intel-gpu.nix"
    "${myModules}/hardware/nvidia-prime.nix"
    "${myModules}/hardware/asus.nix"
    "${myModules}/hardware/zram.nix"
    "${myModules}/hardware/bluetooth.nix"
    "${myModules}/hardware/printing.nix"

    "${myModules}/core/default.nix"
    "${myModules}/nix/default.nix"
    "${myModules}/sound/default.nix"
    "${myModules}/appearance/default.nix"
    "${myModules}/desktop/niri/default.nix"
    "${myModules}/desktop/filemanager.nix"

    "${myModules}/programs/kdeConnect.nix"
    "${myModules}/programs/sandbox.nix"
    "${myModules}/programs/gaming.nix"
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
}
