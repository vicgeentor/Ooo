# Setup with `rclone config` using the secrets inside ../../_secrets/rclone-gdrive-conf.age
# Syncing:
# First run: `rclone bisync gdrive:/ /home/vic/drive/my-drive --resync`
# Every other run (without --resync): `rclone bisync gdrive:/ /home/vic/drive/my-drive`
{
  flake.modules.nixos.rclone =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.rclone ];
    };
}
