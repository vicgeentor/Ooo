{
  flake.modules.homeManager.ghostty =
    hmArgs@{ pkgs, lib, ... }:
    {
      home.packages = [ pkgs.ghostty ];
      home.file = {
        ".config/ghostty/config".source =
          hmArgs.config.lib.file.mkOutOfStoreSymlink "${hmArgs.config.home.homeDirectory}/Ooo/modules/terminals/ghostty/config";
      };

      systemd.user.services = {
        "ghostty" = {
          Unit = {
            Description = "Ghostty";
            After = [
              "graphical-session.target"
              "dbus.socket"
            ];
            Requires = [ "dbus.socket" ];
          };
          Service = {
            Type = "notify-reload";
            Restart = "on-failure";
            ReloadSignal = "SIGUSR2";
            BusName = "com.mitchellh.ghostty";
            ExecStart = ''
              ${lib.getExe pkgs.ghostty} --gtk-single-instance=true --initial-window=false
            '';
          };
          Install = {
            WantedBy = [ "graphical-session.target" ];
          };
        };
      };

    };
}
