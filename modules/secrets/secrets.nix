{ config, inputs, ... }:
let
  bonnibel-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";
  simon-system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDELcORAKNYJcOr1rSfXxxl73pYcGqXxUnSHIbphZ94m";

  jake-vic = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlItoZy7MALjM6h9CrEKFEZkYw5R7Clt5vB8RcEmFgH";
in
{
  flake.modules.nixos.secrets =
    {
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ inputs.agenix.nixosModules.default ];

    };
}
