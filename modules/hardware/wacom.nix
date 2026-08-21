{ pkgs, ... }: {
  # Включаем OpenTabletDriver
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true; # автозапуск демона в пользовательской сессии systemd
  };

  # Дополнительно устанавливаем GUI для удобной калибровки и плагинов
  environment.systemPackages = with pkgs; [
    opentabletdriver
  ];
}
