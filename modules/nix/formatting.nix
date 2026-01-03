{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
    inputs.git-hooks.flakeModule
  ];

  perSystem = {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        mdformat.enable = true;
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

    pre-commit.settings.hooks.treefmt.enable = true;
  };

  flake.modules.nixos.formatting =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.nixfmt-rfc-style ];
    };
}
