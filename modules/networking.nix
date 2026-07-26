{ pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };

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
