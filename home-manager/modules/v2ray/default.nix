{ unstablePkgs, ... }:
let
  secrets = import ./secrets.nix;
  v2rayPkg = unstablePkgs.v2ray;
in {
  
  home.packages = with unstablePkgs; [
    v2ray # Local proxy server
  ];

  xdg.configFile."v2ray/config.json".text = builtins.toJSON {
    log = {
      loglevel = "info";
    };

    inbounds = [
      {
        listen = "127.0.0.1";
        port = 1080;
        protocol = "socks";
        settings = {
          auth = "noauth";
        };
        sniffing = {
          enabled = true;
          destOverride = [ "http" "tls" ];
        };
      }
      {
        listen = "127.0.0.1";
        port = 3128;
        protocol = "http";
        settings = {
          timeout = 0;
        };
      }
    ];

    outbounds = [
      {
        protocol = "socks";
        settings = {
          servers = [
            {
                address = secrets.proxyHost;
                port = secrets.proxySocksPort;
                users = [
                  {
                    user = secrets.proxyUser;
                    pass = secrets.proxyPass;
                  }
                ];
            }
          ];
        };
      }
    ];
  };

  systemd.user.services.v2ray = {
    Unit = {
      Description = "User v2ray client (Project V)";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = "${v2rayPkg}/bin/v2ray run -config %h/.config/v2ray/config.json";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}