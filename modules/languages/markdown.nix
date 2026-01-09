{
  flake.modules.nixos.markdown =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.python3.withPackages (
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
