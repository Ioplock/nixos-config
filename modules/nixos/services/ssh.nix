{ ... }: {
  flake.nixosModules.services-ssh = { ... }: {
    programs.nix-ld.enable = true;

    services.openssh = {
      enable = true;
      ports = [ 22 ];
    };
  };
}
