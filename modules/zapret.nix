{ config, pkgs, inputs, ... }:

{
  # Импортируем модуль из флейка kartavkun
  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
  ];

  # Включаем и настраиваем
  services.zapret-discord-youtube = {
    enable = true;
    config = "general(SIMPLE FAKE)";
  };
}
