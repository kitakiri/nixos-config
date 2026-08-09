{ pkgs, hostname, ... }: {
  imports = [
    ./vpn.nix
    ./proxy.nix
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
  };
}
