{
  flake.modules.homeManager.markdown =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        pandoc
        python313Packages.mdformat
        python313Packages.mdformat-frontmatter
        python313Packages.mdformat-gfm
      ];
    };
}
