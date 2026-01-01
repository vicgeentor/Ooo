{ config, ... }:
{
  flake.modules.nixos.docker =
    {
      pkgs,
      lib,
      ...
    }:
    {
      virtualisation = {
        containers.enable = true;
        docker.enable = true;
      };
      environment.systemPackages = [
        pkgs.compose2nix
      ];

      users.extraGroups.docker.members = [ config.flake.meta.vic.username ];
      users.users.${config.flake.meta.vic.username}.extraGroups = [ "docker" ];

      # Prevent autostart
      systemd.services."docker".wantedBy = lib.mkForce [ ];
    };
}
