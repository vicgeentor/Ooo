{
  flake.modules.nixos.owncloud = {
    services.ocis = {
      enable = true;
    };
  };
}
