{ inputs, ... }:
{
  flake.modules.nixos.base = # NOTE: base module, so no seperate secrets module
    {
      imports = [ inputs.agenix.nixosModules.default ];
      age.secrets.newt.file = ./newt.age;
      age.secrets.pangolin.file = ./pangolin.age;
      age.secrets.traefik.file = ./traefik.age;
      age.secrets.your-spotify.file = ./your-spotify.age;
    };
}
