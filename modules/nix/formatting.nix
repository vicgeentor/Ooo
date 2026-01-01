{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        nixfmt.enable = true;
      };
      settings = {
        on-unmatched = "fatal";
        global.excludes = [
          "*.jpg"
          "*.png"
          "LICENSE"
          "*/.gitignore"
        ];
      };
    };
  };

  flake.modules.nixos.formatting =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.nixfmt-rfc-style ];
    };
}
