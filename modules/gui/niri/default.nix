{
  flake.modules.nixos.niri = {
    programs.niri.enable = true;

    systemd.user.services.niri-flake-polkit.enable = false; # already using dms polkit agent

    # Not needed with dms-greeter
    # programs.bash = {
    #   loginShellInit = ''
    #     if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    #       niri-session -l
    #       exit
    #     fi
    #   '';
    # };

    nix.settings = {
      substituters = [ "https://niri.cachix.org" ];
      trusted-substituters = [ "https://niri.cachix.org" ];
      trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
    };

    xdg.portal.config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };

  flake.modules.homeManager.niri = hmArgs: {
    home.file = {
      ".config/niri/config.kdl".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/niri/config.kdl";
    };
  };
}
