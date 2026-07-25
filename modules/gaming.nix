{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  services.udev = {
    packages = with pkgs; [ game-devices-udev-rules ];
    extraRules = ''
      KERNEL=="hidraw*", ATTRS{idVendor}=="2dc8", MODE="0660", GROUP="input"
      KERNEL=="hidraw*", KERNELS=="*2DC8:*", MODE="0660", GROUP="input"
    '';
  };

  users.users.kitakiri.extraGroups = [
    "input"
  ];
}
