{
  flake.modules.nixos.xdgportal =
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          kdePackages.xdg-desktop-portal-kde
        ];
        config = {
          common = {
            default = [
              "gnome"
              "gtk"
            ];
            "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          };
        };
      };

      environment.systemPackages = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        kdePackages.xdg-desktop-portal-kde
      ];
    };
}
