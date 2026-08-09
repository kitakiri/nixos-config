{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    xray
  ];

  services.v2raya = {
    enable = true;
    cliPackage = pkgs.xray;
  };
}
