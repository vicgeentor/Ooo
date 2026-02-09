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
}
