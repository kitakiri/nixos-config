# home/niri/monitor.nix
{ lib, hostname, ... }:

let
  # Смотрится через `niri msg outputs` на самом хосте.
  # mode = null → niri берёт preferred автоматически (ок для ноута/новых мониторов).
  # mode = "WxH@Hz" → жёстко фиксируем, когда preferred монитора не устраивает.
  monitors = {
    desktop    = { name = "DP-2";      width = 3440; height = 1440; mode = "3440x1440@144.000"; };
    asuslaptop = { name = "eDP-1";     width = 1920; height = 1080; mode = "1920x1080@144.000"; };
    vm         = { name = "Virtual-1"; width = 1920; height = 1080; mode = null; };
  };
in
{
  options.myOptions.monitor = lib.mkOption {
    type = lib.types.submodule {
      options = {
        name   = lib.mkOption { type = lib.types.str; };
        width  = lib.mkOption { type = lib.types.int; };
        height = lib.mkOption { type = lib.types.int; };
        mode   = lib.mkOption { type = lib.types.nullOr lib.types.str; };
      };
    };
    default = monitors.${hostname} or (throw ''
      monitor.nix: для хоста "${hostname}" не задана запись в `monitors`.
    '');
  };
}
