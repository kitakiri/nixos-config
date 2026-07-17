{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nano
    wget
    curl
  ];
}
