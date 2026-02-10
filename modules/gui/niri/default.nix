{ inputs, ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      imports = [ inputs.niri.nixosModules.niri ];
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];

      programs.niri = {
        enable = true;
        package = pkgs.niri-unstable;
      };

      systemd.user.services.niri-flake-polkit.enable = false; # already using dms polkit agent

      programs.bash = {
        loginShellInit = ''
          if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
            niri-session -l
            exit
          fi
        '';
      };

      nix.settings = {
        substituters = [ "https://niri.cachix.org" ];
        trusted-substituters = [ "https://niri.cachix.org" ];
        trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
      };
    };

  flake.modules.homeManager.niri = hmArgs: {
    home.file = {
      ".config/niri/config.kdl".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/niri/config.kdl";
    };
    stylix.targets.niri.enable = false;
  };
}
