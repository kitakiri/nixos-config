{ pkgs, ... }:

{
  # 1. Устанавливаем пакет с курсорами на уровне системы
  environment.systemPackages = with pkgs; [
    kdePackages.breeze
  ];

  # 2. Критично для X11: линкуем директорию с иконками и курсорами
  # в глобальный профиль, чтобы Xwayland-приложения могли их найти
  # environment.pathsToLink = [ "/share/icons" ];

  # 3. Принудительно задаем переменные окружения для всей системы
  environment.sessionVariables = {
    XCURSOR_THEME = "Breeze";
    XCURSOR_SIZE = "54"; # соответствует 36 в wayland
  };

  # 4. Явно указываем Xwayland, где искать курсоры
  # environment.variables = {
  #   XCURSOR_PATH = "/run/current-system/sw/share/icons";
  # };
}
