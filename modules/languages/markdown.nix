{ inputs, ... }:
{
  flake.modules.nixos.markdown =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.python3.withPackages (
          ps: with ps; [
            mdformat
            mdformat-frontmatter
            mdformat-gfm
            mdformat-gfm-alerts
          ]
        ))
      ];
    };
}
