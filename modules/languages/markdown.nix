{
  flake.modules.nixos.markdown =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        pandoc
        python313Packages.mdformat
        python313Packages.mdformat-frontmatter
        python313Packages.mdformat-gfm
      ];
    };

  perSystem.treefmt.programs.mdformat.enable = true;
}
