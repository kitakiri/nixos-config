{ pkgs, ... }:

{
  imports = [
    ./shortcuts.nix
    ./appearance.nix
    ./window-rules.nix
    ./input.nix
    ./apps.nix

    ./kdePackages.nix
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = false; # чтобы plasma.nix на каждой активации удалял и заново генерил конфиги
  };
}
