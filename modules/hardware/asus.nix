# modules/hardware/asus.nix
{ pkgs, ... }: {
  # Утилиты и службы ASUS TUF/ROG (RGB-подсветка, пороги заряда, спецклавиши)
  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  # Управление питанием и температурами
  services.thermald.enable = true;             # Защита от перегрева и троттлинга Intel
  services.power-profiles-daemon.enable = true; # Профили энергосбережения

  # Управление яркостью экрана
  programs.light.enable = true;                 # Udev-правила для работы без sudo

  # Пользовательские утилиты в систему
  environment.systemPackages = with pkgs; [
    asusctl       # Консольное управление ноутбуком (asusctl anime, asusd)
    brightnessctl # Управление подсветкой из CLI/скриптов
  ];
}
