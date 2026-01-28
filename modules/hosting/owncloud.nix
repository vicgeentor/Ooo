{
  flake.modules.nixos.owncloud = {
    services.owncloud = {
      enable = true;
    };
  };
}
