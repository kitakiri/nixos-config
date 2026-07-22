{ config, pkgs, ... }:


{
  services.xray = {
    enable = true;

    settings = {

      log = {
        loglevel = "warning";
      };

      dns = {
        servers = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };

      inbounds = [
        {
          tag = "tun-in";
          protocol = "tun";

          settings = {
            name = "xray0";

            mtu = 1350;

            gateway = [
              "198.18.0.1/30"
            ];

            autoSystemRoutingTable = [
              "0.0.0.0/0"
              "::/0"
            ];

            autoOutboundsInterface = "auto";
          };

          sniffing = {
            enabled = true;

            destOverride = [
              "http"
              "tls"
              "quic"
            ];

            routeOnly = true;
          };
        }
      ];

      outbounds = [

        {
          tag = "proxy";
          protocol = "vless";

          settings = {
            vnext = [
              {
                address = "www.rbinternational.com";
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
          };

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
          tag = "direct";

          protocol = "freedom";

          settings = {
            domainStrategy = "UseIP";
          };
        }

      ];

      routing = {

        domainStrategy = "AsIs";

        rules = [

          {
            type = "field";

            ip = [
              "127.0.0.0/8"
              "10.0.0.0/8"
              "172.16.0.0/12"
              "192.168.0.0/16"
              "169.254.0.0/16"

              "::1/128"
              "fc00::/7"
              "fe80::/10"
            ];

            outboundTag = "direct";
          }

        ];
      };
    };
  };
}
