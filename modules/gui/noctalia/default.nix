{
  flake.modules.nixos.noctalia =
    { pkgs, ... }:
    {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        recommendedServices.enable = true;
      };
      services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          cursor.size = 20;
          keyboard = {
            layout = "us";
            options = "compose:ralt";
            numlock = true;
          };
        };
        cursorTheme = {
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePine-Linux";
        };
      };

      environment.systemPackages = with pkgs; [
        adw-gtk3
        nwg-look
      ];
    };
  flake.modules.homeManager.noctalia = hmArgs: {
    home.file = {
      ".config/noctalia/config.toml".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/noctalia/config.toml";
    };
  };

}
