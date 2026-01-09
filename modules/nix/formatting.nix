{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        nixfmt.enable = true;
      };
      settings = {
        on-unmatched = "debug";
        global.excludes = [
          "*.jpg"
          "*.png"
          "LICENSE"
          "*/.gitignore"
          "*.age"
          "*.jsonc"
          "*.conf"
          "*.ini"
          "*.rasi"
          "*.desktop"
        ];
      };
    };
  };

  flake.modules.nixos.formatting =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.nixfmt ];
    };
}
