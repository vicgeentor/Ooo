{
  flake.modules.nixos.xdgportal =
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-gnome
          pkgs.kdePackages.xdg-desktop-portal-kde
        ];
      };
    };
}
