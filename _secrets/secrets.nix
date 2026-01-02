let
  bonnibel-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";
  simon-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";

  jake-vic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH";
in
{

  "newt.age".publicKeys = [
    jake-vic
    simon-system
  ];

  "pangolin.age".publicKeys = [
    jake-vic
    bonnibel-system
  ];

  "traefik.age".publicKeys = [
    jake-vic
    bonnibel-system
  ];

  "your-spotify.age".publicKeys = [
    jake-vic
    simon-system
  ];

}
