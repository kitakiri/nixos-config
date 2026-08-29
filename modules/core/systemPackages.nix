{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nano
    kdePackages.partitionmanager
  ];
}
