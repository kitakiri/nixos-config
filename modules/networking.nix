{ pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };


  environment.systemPackages = with pkgs; [
    xray
  ];

  services.v2raya = {
    enable = true;
    cliPackage = pkgs.xray;
  };

  services.cloudflare-warp = {
    enable = true;
  };

}
