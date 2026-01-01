{ config, ... }:
{
  flake.modules.nixos.podman =
    { pkgs, ... }:
    {
      virtualisation = {
        containers.enable = true;
        podman = {
          enable = true;
          defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
        };
      };
      environment.systemPackages = [
        pkgs.compose2nix
      ];
      users.users.${config.flake.meta.vic.username}.extraGroups = [ "podman" ];
    };
}
