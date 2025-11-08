{ host, ... }:

{
  networking.hostName = host; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 5432 27017 80 8080 ];  # allow forwarded port
  };
} 
