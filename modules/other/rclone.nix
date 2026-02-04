# Setup:
# `mkdir -p ~/personal`
# `rclone config` using the secrets inside ../../_secrets/rclone-gdrive-conf.age
#
# Syncing:
# First run: `rclone bisync gdrive:/ /home/vic/personal --verbose --resync`
# Every other run (without --resync): `rclone bisync gdrive:/ /home/vic/personal --verbose`
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
