{ ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  services.v2raya.enable = false;

  services.cloudflare-warp = {
    enable = true;
  };

}
