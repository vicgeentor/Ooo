{ config, ... }:
{
  flake.modules.nixos.rclone =
    nixosArgs@{ pkgs, ... }:
    {
      age.secrets.rclone-gdrive-conf = {
        file = ../../_secrets/rclone-gdrive-conf.age;
        mode = "770";
        owner = config.flake.meta.vic.username;
        group = "users";
      };

      environment.systemPackages = [ pkgs.rclone ];
      fileSystems."/home/${config.flake.meta.vic.username}/drive/my-drive" = {
        device = "gdrive:/";
        fsType = "rclone";
        options = [
          "nodev"
          "nofail"
          "allow_other"
          "args2env"
          "config=${nixosArgs.config.age.secrets.rclone-gdrive-conf.path}"
        ];
      };

      fileSystems."/home/${config.flake.meta.vic.username}/drive/shared-with-me" = {
        device = "gdrive-shared:/";
        fsType = "rclone";
        options = [
          "nodev"
          "nofail"
          "allow_other"
          "args2env"
          "config=${nixosArgs.config.age.secrets.rclone-gdrive-conf.path}"
        ];
      };
    };
}
