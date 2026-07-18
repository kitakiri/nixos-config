{ ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  services.cloudflare-warp = {
    enable = true;
  };

}
