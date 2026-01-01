{
  flake.modules.nixos.ente-auth =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.ente-auth ];
      services.gnome.gnome-keyring.enable = true;
    };
}
