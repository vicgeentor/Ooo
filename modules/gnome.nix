{
  flake.modules.nixos.gnome = {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.games.enable = false;
  };
}
