{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ]; # драйвер для Epson (ESC/P-R, подходит L3151)
  };

  # Автообнаружение принтера в сети через mDNS/Bonjour
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
