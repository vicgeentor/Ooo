{ inputs, ... }:
{
  flake.modules.nixos.base = {
    imports = [ inputs.agenix.nixosModules.default ];
    age.secrets.newt.file = ../../_secrets/newt.age;
    age.secrets.pangolin.file = ../../_secrets/pangolin.age;
    age.secrets.traefik.file = ../../_secrets/traefik.age;
    age.secrets.your-spotify.file = ../../_secrets/your-spotify.age;
  };
}
