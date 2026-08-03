{
  flake.modules.nixos.wayland =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        hyprmag
        wl-clipboard
        wl-screenrec
        xeyes
        xwayland-satellite
      ];
    };
}
