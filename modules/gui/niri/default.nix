{
  flake.modules.nixos.niri = {
    programs.niri.enable = true;

    programs.bash = {
      loginShellInit = ''
        if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
          niri-session -l
        fi
      '';
    };
  };

  flake.modules.homeManager.niri = hmArgs: {
    home.file = {
      ".config/niri".source =
        hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/gui/niri/config.kdl";
    };
  };

}
