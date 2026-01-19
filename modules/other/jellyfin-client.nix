{
  flake.modules.nixos.jellyfin-client =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        jellyfin-desktop
        jellyfin-mpv-shim
      ];
    };
}
