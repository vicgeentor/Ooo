# Module not needed due to stylix
{
  flake.modules.homeManager.gtk =
    { pkgs, ... }:
    {
      gtk = {
        enable = true;

        theme = {
          package = pkgs.rose-pine-gtk-theme;
          name = "rose-pine";
        };

        font = {
          name = "Ubuntu Nerd Font";
          size = 11;
        };
      };
    };
}
