{
  flake.modules.nixos.wayland =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        hyprmagnifier
        wl-clipboard
        wl-screenrec
        xeyes
        xwayland-satellite
      ];
    };
}
