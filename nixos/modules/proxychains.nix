{ config, pkgs, ... }: {
  environment.systemPackages = [
    pkgs.proxychains-ng
  ];

  environment.etc."proxychains.conf".text = ''
    strict_chain
    proxy_dns

    tcp_read_time_out 15000
    tcp_connect_time_out 8000

    [ProxyList]
    socks5  127.0.0.1 1080
    # http   127.0.0.1 3128
  '';
}
