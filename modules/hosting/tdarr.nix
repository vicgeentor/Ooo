{ inputs, ... }:
{
  flake.modules.nixos.tdarr =
    let
      pkgs-tdarr = import inputs.nixpkgs-tdarr {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      environment.systemPackages = [
        pkgs-tdarr.tdarr
      ];
    };
}
