{
  flake.modules.nixos.owncloud = nixosArgs: {
    age.secrets.ocis.file = ../../_secrets/ocis.age;

    services.ocis = {
      enable = true;
      environmentFile = nixosArgs.config.age.secrets.ocis.path;
    };
  };
}
