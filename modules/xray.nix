{ config, pkgs, ... }:

{
  services.xray = {
    enable = true;
    settings = {
      log.loglevel = "warning";

      inbounds = [
        {
          tag = "tun-in";
          protocol = "tun";
          settings = {
            autoRoute = true;
            strictRoute = true;
            endpointAddress = "198.18.0.1";
            mtu = 1350; # Заниженный MTU для работы звонков
          };
        }
      ];

      outbounds = [
        {
          protocol = "vless";
          tag = "proxy";
          settings.vnext = [
            {
              address = "147.45.41.124";
              port = 443;
              users = [
                {
                  id = "ea69c0a0-697d-4c5e-9386-f72724c48086";
                  encryption = "none";
                  packetEncoding = "xudp";
                }
              ];
            }
          ];
          streamSettings = {
            network = "xhttp";
            security = "reality";
            realitySettings = {
              serverName = "www.rbinternational.com";
              fingerprint = "firefox";
              publicKey = "19sAMCdyhiJtpe8nfxukbjXNoVXpmKXw43DudozUuR8";
              shortId = "47c1c44eb69fe65c";
              show = false;
            };
            xhttpSettings = {
              mode = "packet-up";
              path = "/de/raiffeisen/blog.html";
            };
          };
        }
        {
          protocol = "freedom";
          tag = "direct";
        }
      ];

      routing = {
        domainStrategy = "AsIs";
        rules = [
          {
            type = "field";
            # Явно указываем локальные сети, чтобы они шли мимо VPN
            ip = [
              "192.168.0.0/16"
              "10.0.0.0/8"
              "172.16.0.0/12"
              "127.0.0.0/8"
            ];
            outboundTag = "direct";
          }
        ];
      };
    };
  };
}
