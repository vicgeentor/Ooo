{ inputs, ... }:
let
  bonnibel-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";
  simon-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";

  jake-vic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH";
in
{
  flake.modules.nixos.base = # NOTE: base module, so no seperate secrets module
    {
      imports = [ inputs.agenix.nixosModules.default ];

      "newt.age".publicKeys = [
        jake-vic
        simon-system
      ];
      # age.secrets.newt.file = ./newt.age;

      "pangolin.age".publicKeys = [
        jake-vic
        bonnibel-system
      ];
      # age.secrets.pangolin.file = ./pangolin.age;

      "traefik.age".publicKeys = [
        jake-vic
        bonnibel-system
      ];
      # age.secrets.traefik.file = ./traefik.age;

      "your-spotify.age".publicKeys = [
        jake-vic
        simon-system
      ];
      # age.secrets.your-spotify.file = ./your-spotify.age;

    };
}
