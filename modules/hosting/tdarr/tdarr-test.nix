{ inputs, ... }:
{
  flake.modules.nixos.tdarr-test =
    let
      pkgs-tdarr = import inputs.nixpkgs-tdarr {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    { pkgs, ... }:
    {
      # imports = [ "${inputs.nixpkgs-tdarr}/nixos/modules/services/misc/tdarr.nix" ];
      imports = [ ./_tdarr.nix ];

      services.tdarr = {
        enable = true;
        # package = pkgs-tdarr.tdarr;
        package = (pkgs.callPackage ./_package.nix);
        nodes.main = {
          enable = true;
        };
      };

      systemd.services.tdarr-node-main = {
        environment = {
          "transcodecpuWorkers" = "3";
          "healthcheckcpuWorkers" = "1";
        };
      };
    };
}
