{
  pkgs,
  ...
}: {
  imports = [
    ./gc.nix
    ./nix-ld.nix
  ];

  environment.systemPackages = with pkgs; [
    nixd
  ];
}
