# Setup:
# `mkdir -p ~/drive/my-drive`
# `mkdir -p ~/drive/shared-with-me with`
# `rclone config` using the secrets inside ../../_secrets/rclone-gdrive-conf.age
#
# Syncing:
# First run: `rclone bisync gdrive:/ /home/vic/drive/my-drive --resync --verbose`
# Every other run (without --resync): `rclone bisync gdrive:/ /home/vic/drive/my-drive --verbose`
#
# Deduplication:
# `rclone dedup gdrive:/ --verbose`
{
  flake.modules.nixos.rclone =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.rclone ];
    };
}
