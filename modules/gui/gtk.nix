{
  flake.modules.homeManager.gtk =
    { pkgs, ... }:
    {
      gtk = {
        enable = true;
        font = {
          package = pkgs.nerd-fonts.ubuntu;
          name = "Ubuntu Nerd Font";
          size = 11;
        };
        iconTheme = {
          package = pkgs.papirus-icon-theme;
          name = "Papirus";
        };
      };
    };
}
