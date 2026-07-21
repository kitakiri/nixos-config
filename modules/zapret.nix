# Файл: zapret.nix
# Назначение: Обеспечение бесперебойной работы коммуникационной платформы Discord
# (Текстовая сигнализация, Медиа, Голосовой трафик WebRTC) в условиях агрессивного DPI.

{ config, pkgs, lib, ... }:

let
  discordSubnetsFile = pkgs.writeText "discord-subnets.txt" ''
    18.165.140.0/25
    23.227.38.74/32
    34.0.0.0/15
    34.2.0.0/16
    34.3.0.0/23
    34.3.2.0/24
    35.192.0.0/12
    35.208.0.0/12
    35.224.0.0/12
    35.240.0.0/13
    64.233.161.207/32
    64.233.162.207/32
    64.233.163.207/32
    64.233.164.207/32
    64.233.165.207/32
    74.125.131.207/32
    74.125.205.207/32
    104.16.0.0/12
    104.17.51.93/32
    104.17.117.93/32
    104.18.4.161/32
    104.18.5.161/32
    104.18.8.105/32
    104.18.9.105/32
    104.18.30.128/32
    104.18.31.128/32
    104.21.2.204/32
    138.128.136.0/21
    162.158.0.0/15
    172.64.0.0/13
    5.200.14.128/25
    66.22.192.0/18
  '';
in
{
  # Возвращаем iptables для совместимости с zapret
  networking.nftables.enable = false;
  networking.firewall.enable = true;

  # Декларативная конфигурация подсистемы DPI bypass (zapret)
  services.zapret = {
    enable = true;
    udpSupport = true;
    udpPorts = [ "443" "50000:50100" ];

    params = [
      # БЛОК 1: Стратегия обхода для плоскости данных (UDP WebRTC Voice/Video)
      "--filter-udp=443,50000-50100"
      "--ipset=${discordSubnetsFile}"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-any-protocol=1"
      "--dpi-desync-cutoff=d4"

      "--new"

      # БЛОК 2: Стратегия обхода для сигнальной плоскости и API (TCP HTTPS/WSS)
      "--filter-tcp=443"
      "--ipset=${discordSubnetsFile}"
      "--dpi-desync=fake,disorder2"
      "--dpi-desync-autottl=2"
      "--dpi-desync-fooling=md5sig,badseq"
    ];
  };
}
