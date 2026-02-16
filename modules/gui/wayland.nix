{
  flake.modules.nixos.wayland =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wl-clipboard
        wl-screenrec
        xeyes # Run `xeyes` to show xwayland windows
        xwayland-satellite
      ];
    };
}
